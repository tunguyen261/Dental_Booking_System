/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admins;

import discounts.DiscountDAO;
import discounts.DiscountDTO;
import discounts.DiscountError;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class UpdateDiscountController extends HttpServlet {

    public static final String ERROR = "LoadAdminController";
    public static final String SUCCESS = "LoadDiscountController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        DiscountError discountError = new DiscountError();
        try {
            int svType= Integer.parseInt(request.getParameter("serviceTypeID"));
            int discountID = Integer.parseInt(request.getParameter("discountID"));
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            int percentDiscount = Integer.parseInt(request.getParameter("percentDiscount"));
            int status = Integer.parseInt(request.getParameter("status"));
            String createDate = request.getParameter("createDate");
            String expiredDate = request.getParameter("expiredDate");
            int adminID = Integer.parseInt(request.getParameter("adminID"));

//            check validation here: checkId, name, role , pass,...password
            boolean check = true;
            if (title.trim().length() == 0 || title.trim().length() > 50) {
                discountError.setTitleError("Tên chủ đề khuyến mãi phải từ [1,50]");
                check = false;
            }

            if (percentDiscount < 0) {
                discountError.setPercentDiscountError("Phần trăm khuyến mãi không âm");
                check = false;
            }
            DiscountDAO dao = new DiscountDAO();
            DiscountDTO discount = new DiscountDTO(discountID, title, description, percentDiscount, status, createDate, expiredDate, adminID);

            if (check) {
                boolean checkUpdate = dao.updateDiscount(discount);
                if (checkUpdate) {
                    url = SUCCESS;
                    request.setAttribute("serviceTypeID", svType);
                    request.setAttribute("SSMSG", "Chỉnh sữa thành công !");
                }
            } else {
                request.setAttribute("SSMSG", "Chỉnh sữa thất bại !");
            }
        } catch (Exception e) {
            url = ERROR;
            log("Error at Update Discount Controller");
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
