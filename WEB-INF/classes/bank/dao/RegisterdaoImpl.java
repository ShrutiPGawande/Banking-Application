package bank.dao;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import bank.db.bankdbConnection;
import bank.model.Register;

public class RegisterdaoImpl implements Registerdao {

	bankdbConnection bc=new bankdbConnection();
	@Override
	public int create(List<Register> lst) {
		
		int i=0;
	//	RegisterdaoImp bc=new bankdbConnection();
		Connection conn= bc.getDBConnection();
		
		Register regobj = lst.get(0);
		
		try {
			PreparedStatement pstate = conn.prepareStatement("insert into bank values(?,?,?,?,?)");
			pstate.setInt(1, regobj.getRegno());
			pstate.setString(2, regobj.getCustname());
			pstate.setString(3, regobj.getUsername());
			pstate.setString(4, regobj.getPassword());
			pstate.setFloat(5, regobj.getAccbal());
			
			i=pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}


		
		return i;
	}

	@Override
	public List<Register> Retrieve(int regno) {
		List<Register> lst=null;
		
		try {
			Connection conn=bc.getDBConnection();
			PreparedStatement pstate=conn.prepareStatement("select * from bank where reg_no=?");
			pstate.setInt(1, regno);
			ResultSet Result =pstate.executeQuery();
			if(Result.next()) {
				lst=new ArrayList<Register>();
				Register robj=new Register(Result.getInt(1), Result.getString(2),  Result.getString(3),  Result.getString(4), Result.getFloat(5));
				lst.add(robj);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lst;
	}

	@Override
	public boolean Login(String username, String password ) {
		boolean b=false;
		Connection conn=null;

		try {
			conn =bc.getDBConnection();
			PreparedStatement pstate=conn.prepareStatement("select * from bank where username=? and password=?");
			pstate.setString(1, username);
			pstate.setString(2, password);
			ResultSet Result =pstate.executeQuery();
			if(Result.next()) {
				b=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return b;
	}

	@Override
	public int DeleteRecord(int regno) {
		Connection conn=null;
		int i=0;
		
		try {
			conn=bc.getDBConnection();
			PreparedStatement pstate=conn.prepareStatement("delete from bank where reg_no = ?");
			pstate.setInt(1, regno);
			i=pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public int UpdateRecord(Register reg) {
		Connection conn=null;
		int i=0;
		List<Register> lst=null;
		
		try {
			conn=bc.getDBConnection();
			PreparedStatement pstate = conn.prepareStatement("update bank set acc_bal=? where reg_no=?");
			pstate.setFloat(1, reg.getAccbal());
			pstate.setInt(2, reg.getRegno());
			 i=pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	@Override
	public Register getRecord(int regno) {
	    Connection conn = null;
	    Register register = null;

	    try {
	        conn = bc.getDBConnection();
	        PreparedStatement pstate = conn.prepareStatement("SELECT * FROM bank WHERE reg_no = ?");
	        pstate.setInt(1, regno);
	        ResultSet result = pstate.executeQuery();

	        if (result.next()) {
	            register = new Register(
	                result.getInt("reg_no"),
	                result.getString("custname"),
	                result.getString("username"),
	                result.getString("password"),
	                result.getFloat("acc_bal")
	            );
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (conn != null) {
	                conn.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return register;
	}


	@Override
	public List<Register> list() {
		int i=0;
		Connection conn=null;
		List<Register>lst=new LinkedList<Register>();
		try {
			conn=bc.getDBConnection();
			String str = "select * from bank";
			
			Statement state=conn.createStatement();
			ResultSet result=state.executeQuery(str);
			
			while(result.next())
			{
				Register reg=new Register(result.getInt(1),result.getString(2), result.getString(3), result.getString(4), result.getFloat(5));
				lst.add(reg);
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return lst;
	}

		@Override
		public int CreditAmount(int regno, float creditAmount) {
		    Connection conn = null;
		    int i = 0;

		    try {
		        conn = bc.getDBConnection();
		        // Check if the account exists
		        PreparedStatement checkAccount = conn.prepareStatement("SELECT acc_bal FROM bank WHERE reg_no = ?");
		        checkAccount.setInt(1, regno);
		        ResultSet accountResult = checkAccount.executeQuery();

		        if (accountResult.next()) {
		            // Account exists, retrieve current balance
		            float existingBalance = accountResult.getFloat("acc_bal");

		            // Update the account balance by adding the credit amount
		            float updatedBalance = existingBalance + creditAmount;

		            // Perform the update
		            PreparedStatement updateBalance = conn.prepareStatement("UPDATE bank SET acc_bal = ? WHERE reg_no = ?");
		            updateBalance.setFloat(1, updatedBalance);
		            updateBalance.setInt(2, regno);
		            i = updateBalance.executeUpdate();
		        } else {
		            // Account doesn't exist
		            i = -1; // You can choose an appropriate negative value to indicate this
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        try {
		            if (conn != null) {
		                conn.close();
		            }
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }

		    return i;
		}


	
}
