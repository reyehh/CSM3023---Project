import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;


@WebServlet("/")
public class UnclaimParcelServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UnclaimParcelDAO unclaimParcelDAO;

    public void init() {
        unclaimParcelDAO = new UnclaimParcelDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response); 
                    break;
                case "/insert":
                    insertUnclaimParcel(request, response);
                    break;
                case "/delete":
                    deleteUnclaimParcel(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateUnclaimParcel(request, response); 
                    break;
                default:
                    listUnclaimParcel(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listUnclaimParcel(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException, ServletException {
        List<UnclaimParcel> listUnclaimParcel = unclaimParcelDAO.getAllUnclaimParcels();
        request.setAttribute("listUnclaimParcel", listUnclaimParcel);
        RequestDispatcher dispatcher = request.getRequestDispatcher("UnclaimParcelList.jsp"); 
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("UnclaimParcelForm.jsp"); 
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, ServletException, IOException {
        int batchID = Integer.parseInt(request.getParameter("batchID"));  
        UnclaimParcel existingUnclaimParcel = unclaimParcelDAO.selectUnclaimParcel(batchID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("UnclaimParcelForm.jsp"); 
        request.setAttribute("unclaimParcel", existingUnclaimParcel); 
        dispatcher.forward(request, response);
    }

    private void insertUnclaimParcel(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException {
        String parcelNo = request.getParameter("parcelNo");
        String parcelID = request.getParameter("parcelID");
        String studID = request.getParameter("studID");
        UnclaimParcel newUnclaimParcel = new UnclaimParcel(parcelNo, parcelID, studID);
        unclaimParcelDAO.insertUnclaimParcel(newUnclaimParcel); 
        response.sendRedirect("unclaimParcel.jsp");
    }

    private void updateUnclaimParcel(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException {
        int batchID = Integer.parseInt(request.getParameter("batchID"));
        String parcelNo = request.getParameter("parcelNo");
        String parcelID = request.getParameter("parcelID");
        String studID = request.getParameter("studID");
        UnclaimParcel unclaimParcel = new UnclaimParcel(batchID, parcelNo, parcelID, studID); 
        unclaimParcelDAO.updateUnclaimParcel(unclaimParcel); 
        response.sendRedirect("unclaimParcel.jsp");
    }

    private void deleteUnclaimParcel(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException {
        int batchID = Integer.parseInt(request.getParameter("batchID"));
        unclaimParcelDAO.deleteUnclaimParcel(batchID); 
        response.sendRedirect("unclaimParcel.jsp");
    }
}