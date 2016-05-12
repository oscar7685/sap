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
    private static List<String> personasLogueadas = new ArrayList<String>();

    public static List<String> getPersonasLogueadas() {
        return personasLogueadas;
    }

    public static void setPersonasLogueadas(List<String> personasLogueadas) {
        SessionCountListener.personasLogueadas = personasLogueadas;
    }

    public static void addPersonaLogueada(String personaLogueada) {
        personasLogueadas.add(personaLogueada);
    }

    public void sessionCreated(final HttpSessionEvent event) {
        numberOfSessionsCount++;
    }

    public void sessionDestroyed(final HttpSessionEvent event) {
        numberOfSessionsCount--;
        for (int i = 0; i < personasLogueadas.size(); i++) {
            if (personasLogueadas.get(i).equals(event.getSession().getAttribute("personaLogueada"))) {
                personasLogueadas.remove(i);
                break;
            }
        }
    }

    public static int getNumberOfSessionsCount() {
        return numberOfSessionsCount;
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
