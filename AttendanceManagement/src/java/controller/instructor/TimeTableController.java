/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.instructor;

import dal.SessionDBContext;
import dal.TimeSlotDBContext;
import entity.Session;
import entity.TimeSlot;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.sql.Date;
import java.text.ParseException;
import java.time.LocalDate;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DateTimeHelper;

/**
 *
 * @author sonnt
 */
public class TimeTableController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.text.ParseException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        LocalDate currentDate = LocalDate.now();
        int index;
        int instructorid = Integer.parseInt(request.getParameter("id"));

        String selectedYear = request.getParameter("year");
        String btnWeek = request.getParameter("btnWeek");
        String weekString = request.getParameter("selectedWeek");

        String[] dateParts;
        ArrayList<Date> dates = new ArrayList<>();
        List<String> weeksOfYear = new ArrayList<>();

        if (selectedYear == null) {
            weeksOfYear = DateTimeHelper.getWeeksOfYear(currentDate.getYear());
        } else {
            int year = Integer.parseInt(selectedYear);
            weeksOfYear = DateTimeHelper.getWeeksOfYear(year);
        }

        if (weekString == null) {
            dates = DateTimeHelper.getCurrentWeekDates();
        } else {
            try {
                index = getIndex(weeksOfYear, weekString);
                if (btnWeek != null) {
                    if (index != -1) {
                        try {
                            if ("next".equals(btnWeek)) {
                                weekString = weeksOfYear.get(index + 1);
                            } else {
                                weekString = weeksOfYear.get(index - 1);
                            }
                        } catch (IndexOutOfBoundsException e) {
                            request.setAttribute("mess", "Please select another year to see the next week!");
                        }
                    }
                }
                dateParts = weekString.split(" to ");
                dates = DateTimeHelper.getSqlDatesInRange(dateParts[0], dateParts[1]);
            } catch (ParseException ex ) {
                Logger.getLogger(TimeTableController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        TimeSlotDBContext timeDB = new TimeSlotDBContext();
        ArrayList<TimeSlot> slots = timeDB.list();

        SessionDBContext sessDB = new SessionDBContext();
        ArrayList<Session> sessions = sessDB.getSessions(instructorid, dates.get(0), dates.get(dates.size() - 1));

        request.setAttribute("slots", slots);
        request.setAttribute("dates", dates);
        request.setAttribute("sessions", sessions);
        request.setAttribute("weeks", weeksOfYear);
        request.setAttribute("currentWeek", dates.get(0).toString() + " to " + dates.get(dates.size() - 1));
        request.getRequestDispatcher("../jsp/instructor/timetable.jsp").forward(request, response);

    }

    public static int getIndex(List<String> myList, String element) {
        int index = -1;
        for (int i = 0; i < myList.size(); i++) {
            if (element.equals(myList.get(i))) {
                index = i;
                break;
            }
        }
        return index;
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(TimeTableController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(TimeTableController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
