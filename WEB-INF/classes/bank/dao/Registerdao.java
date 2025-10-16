package bank.dao;

import java.util.List;


import bank.model.Register;

public interface Registerdao {

	int create(List<Register> lst) ;
	List<Register> Retrieve(int regno);
	boolean Login(String username, String password);
	int DeleteRecord(int regno);
	int UpdateRecord(Register reg);
	int CreditAmount(int regno, float credit);
	public Register getRecord(int regno);

	List<Register> list();
}
