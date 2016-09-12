/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.EncabezadoFacade;
import com.sap.ejb.MuestraadministrativoFacade;
import com.sap.ejb.MuestraagenciaFacade;
import com.sap.ejb.MuestradirectorFacade;
import com.sap.ejb.MuestradocenteFacade;
import com.sap.ejb.MuestraegresadoFacade;
import com.sap.ejb.MuestraempleadorFacade;
import com.sap.ejb.MuestraestudianteFacade;
import com.sap.ejb.MuestrapersonaFacade;
import com.sap.entity.Encabezado;
import com.sap.entity.Muestra;
import com.sap.entity.Proceso;
import com.sap.interfaz.Action;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author acreditacion
 */
public class EstadoProceso implements Action {
    MuestraagenciaFacade muestraagenciaFacade = lookupMuestraagenciaFacadeBean();
    EncabezadoFacade encabezadoFacade = lookupEncabezadoFacadeBean();
    MuestraempleadorFacade muestraempleadorFacade = lookupMuestraempleadorFacadeBean();
    MuestradirectorFacade muestradirectorFacade = lookupMuestradirectorFacadeBean();
    MuestraadministrativoFacade muestraadministrativoFacade = lookupMuestraadministrativoFacadeBean();
    MuestraegresadoFacade muestraegresadoFacade = lookupMuestraegresadoFacadeBean();
    MuestradocenteFacade muestradocenteFacade = lookupMuestradocenteFacadeBean();
    MuestraestudianteFacade muestraestudianteFacade = lookupMuestraestudianteFacadeBean();
    MuestrapersonaFacade muestrapersonaFacade = lookupMuestrapersonaFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso p = (Proceso) sesion.getAttribute("Proceso");
        Muestra m = p.getMuestraList().get(0);
        int totalMuestra = muestrapersonaFacade.countByProperty("muestraId", m);
        int totalEst = muestraestudianteFacade.countByProperty("muestrapersonaId.muestraId", m);
        int totalDoc = muestradocenteFacade.countByProperty("muestrapersonaId.muestraId", m);
        int totalEgr = muestraegresadoFacade.countByProperty("muestrapersonaId.muestraId", m);
        int totalAdm = muestraadministrativoFacade.countByProperty("muestrapersonaId.muestraId", m);
        int totalDir = muestradirectorFacade.countByProperty("muestrapersonaId.muestraId", m);
        int totalEmp = muestraempleadorFacade.countByProperty("muestrapersonaId.muestraId", m);
        int totalVis = muestraagenciaFacade.countByProperty("muestrapersonaId.muestraId", m);

        List<Encabezado> encabezados = encabezadoFacade.findByList2("procesoId", m.getProcesoId(), "estado", "terminado");

        int terminados = encabezados.size();
        int terminadosEst = 0;
        int terminadosDoc = 0;
        int terminadosEgr = 0;
        int terminadosAdm = 0;
        int terminadosDir = 0;
        int terminadosEmp = 0;
        int terminadosVis = 0;
        for (Encabezado encabezado : encabezados) {
            if (encabezado.getFuenteId().getId() == 1) {
                terminadosEst++;
            } else if (encabezado.getFuenteId().getId() == 2) {
                terminadosDoc++;
            } else if (encabezado.getFuenteId().getId() == 3) {
                terminadosAdm++;
            } else if (encabezado.getFuenteId().getId() == 4) {
                terminadosEgr++;
            } else if (encabezado.getFuenteId().getId() == 5) {
                terminadosDir++;
            } else if (encabezado.getFuenteId().getId() == 6) {
                terminadosEmp++;
            } else if (encabezado.getFuenteId().getId() == 7) {
                terminadosVis++;
            }
        }
        sesion.setAttribute("terminadosX", terminados);
        sesion.setAttribute("totalMuestraX", totalMuestra);
        sesion.setAttribute("totalEst", totalEst);
        sesion.setAttribute("terminadosEst", terminadosEst);
        sesion.setAttribute("totalDoc", totalDoc);
        sesion.setAttribute("terminadosDoc", terminadosDoc);
        sesion.setAttribute("totalEgr", totalEgr);
        sesion.setAttribute("terminadosEgr", terminadosEgr);
        sesion.setAttribute("totalEmp", totalEmp);
        sesion.setAttribute("terminadosEmp", terminadosEmp);
        sesion.setAttribute("totalAdm", totalAdm);
        sesion.setAttribute("terminadosAdm", terminadosAdm);
        sesion.setAttribute("totalDir", totalDir);
        sesion.setAttribute("terminadosDir", terminadosDir);
        sesion.setAttribute("totalVis", totalVis);
        sesion.setAttribute("terminadosVis", terminadosVis);
        return "/WEB-INF/vista/comitePrograma/proceso/informe/estadoProceso.jsp";
    }

    private MuestrapersonaFacade lookupMuestrapersonaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestrapersonaFacade) c.lookup("java:global/sap/MuestrapersonaFacade!com.sap.ejb.MuestrapersonaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestraestudianteFacade lookupMuestraestudianteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraestudianteFacade) c.lookup("java:global/sap/MuestraestudianteFacade!com.sap.ejb.MuestraestudianteFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestradocenteFacade lookupMuestradocenteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestradocenteFacade) c.lookup("java:global/sap/MuestradocenteFacade!com.sap.ejb.MuestradocenteFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestraegresadoFacade lookupMuestraegresadoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraegresadoFacade) c.lookup("java:global/sap/MuestraegresadoFacade!com.sap.ejb.MuestraegresadoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestraadministrativoFacade lookupMuestraadministrativoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraadministrativoFacade) c.lookup("java:global/sap/MuestraadministrativoFacade!com.sap.ejb.MuestraadministrativoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestradirectorFacade lookupMuestradirectorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestradirectorFacade) c.lookup("java:global/sap/MuestradirectorFacade!com.sap.ejb.MuestradirectorFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestraempleadorFacade lookupMuestraempleadorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraempleadorFacade) c.lookup("java:global/sap/MuestraempleadorFacade!com.sap.ejb.MuestraempleadorFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private EncabezadoFacade lookupEncabezadoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EncabezadoFacade) c.lookup("java:global/sap/EncabezadoFacade!com.sap.ejb.EncabezadoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestraagenciaFacade lookupMuestraagenciaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraagenciaFacade) c.lookup("java:global/sap/MuestraagenciaFacade!com.sap.ejb.MuestraagenciaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
