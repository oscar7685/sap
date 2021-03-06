/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.entity.Proceso;
import com.sap.interfaz.Action;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author acreditacion
 */
public class PreparedCrearEvaluador implements Action {

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso proceso = (Proceso) sesion.getAttribute("Proceso");
        String fuente = request.getParameter("fuente");
        if (fuente.equals("Estudiante")) {
            sesion.setAttribute("selectorFuente", "Estudiante");
        } else if (fuente.equals("Docente")) {
            sesion.setAttribute("selectorFuente", "Docente");
        } else if (fuente.equals("Egresado")) {
            sesion.setAttribute("selectorFuente", "Egresado");
        } else if (fuente.equals("Administrativo")) {
            sesion.setAttribute("selectorFuente", "Administrativo");
        } else if (fuente.equals("Empleador")) {
            sesion.setAttribute("selectorFuente", "Empleador");
        } else if (fuente.equals("Directivo")) {
            sesion.setAttribute("selectorFuente", "Directivo");
        }


        return "/WEB-INF/vista/comitePrograma/muestra/crearEvaluador.jsp";
    }
}
