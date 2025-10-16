package bank.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bank.dao.Registerdao;
import bank.dao.RegisterdaoImpl;
import bank.model.Register;

@WebServlet("/CreditController")
public class CreditController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CreditController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int regno = Integer.parseInt(request.getParameter("regno"));
        float creditAmount = Float.parseFloat(request.getParameter("credit"));

        Register regobj=new Register(regno, getServletName(), getServletName(), getServletInfo(), creditAmount);
        Register rdao = regobj.getRecord(regno); // You need to implement this method in your DAO

        if (regobj != null) {
            float existingBalance = regobj.getAccbal();
            float updatedBalance = existingBalance + creditAmount;
            regobj.setAccbal(updatedBalance);

            int i = rdao.UpdateRecord(regobj);

            if (i > 0) {
                response.sendRedirect("Home.jsp");
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
