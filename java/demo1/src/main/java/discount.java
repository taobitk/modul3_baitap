import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "discount", value = "/display-discount")
public class discount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String description = req.getParameter("description");
        double list_price = Double.parseDouble(req.getParameter("list_price"));
        double discount = Double.parseDouble(req.getParameter("discount"));
        double DiscountAmount = list_price*discount* 0.01 ;
        req.setAttribute("DiscountAmount", DiscountAmount);
        req.getRequestDispatcher("yaa.jsp").forward(req, resp);
    }
}