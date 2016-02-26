/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.controller;

import com.sap.entity.Representante;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

public class SessionCountListener implements HttpSessionListener, ServletContextListener {

    private static int numberOfSessionsCount = 0;
    //public static List<Representante> representantesLogueados = new ArrayList<Representante>();

    public void sessionCreated(final HttpSessionEvent event) {
        SessionCountListener.numberOfSessionsCount++;
    }

    public void sessionDestroyed(final HttpSessionEvent event) {
        SessionCountListener.numberOfSessionsCount--;
        /*Representante r = (Representante) event.getSession().getAttribute("representante");
        if (r != null) {
            SessionCountListener.representantesLogueados.remove(r);
        }*/
    }

    public static final int getCount() {
        return SessionCountListener.numberOfSessionsCount;
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        System.setProperty("rootPath", context.getRealPath("/"));
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        
    }

}
