package com.sap.utils;

import com.sap.ejb.AdministrativoFacade;
import com.sap.ejb.DirectorprogramaFacade;
import com.sap.ejb.DocenteFacade;
import com.sap.ejb.EgresadoFacade;
import com.sap.ejb.EmpleadorFacade;
import com.sap.ejb.EstudianteFacade;
import com.sap.ejb.FuenteFacade;
import com.sap.ejb.PersonaFacade;
import com.sap.entity.Administrativo;
import com.sap.entity.Directorprograma;
import com.sap.entity.Docente;
import com.sap.entity.Egresado;
import com.sap.entity.Empleador;
import com.sap.entity.Estudiante;
import com.sap.entity.Persona;
import com.sap.entity.Proceso;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.jstl.sql.Result;
import javax.transaction.UserTransaction;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.DataFormatter;

public class LectorXLSX {

    private final Logger LOGGER = Logger.getLogger(LectorXLSX.class);
    EmpleadorFacade empleadorFacade = lookupEmpleadorFacadeBean();
    DirectorprogramaFacade directorprogramaFacade = lookupDirectorprogramaFacadeBean();
    AdministrativoFacade administrativoFacade = lookupAdministrativoFacadeBean();
    EgresadoFacade egresadoFacade = lookupEgresadoFacadeBean();
    DocenteFacade docenteFacade = lookupDocenteFacadeBean();
    EstudianteFacade estudianteFacade = lookupEstudianteFacadeBean();
    FuenteFacade fuenteFacade = lookupFuenteFacadeBean();
    PersonaFacade personaFacade = lookupPersonaFacadeBean();
    PrintWriter out;
    public boolean errorGlobal = false;
    public boolean personaExistente = false;

    public LectorXLSX(File fileName, Proceso p, HttpServletResponse response, String fuente) throws ParseException, IOException {
        out = response.getWriter();
        //tienen 4 columnas
        try {
            FileInputStream fileInputStream = new FileInputStream(fileName);
            XSSFWorkbook workBook = new XSSFWorkbook(fileInputStream);
            List cellDataList = new ArrayList();
            XSSFSheet hssfSheet = workBook.getSheetAt(0);
            Iterator rowIterator = hssfSheet.rowIterator();
            while (rowIterator.hasNext()) {
                XSSFRow hssfRow = (XSSFRow) rowIterator.next();
                List cellTempList = new ArrayList();
                int numColumnas = 4;
                if (fuente.equals("Egresado") || fuente.equals("Directivo")) {
                    numColumnas = 3;
                } else if (fuente.equals("Empleador")) {
                    numColumnas = 3;
                }
                for (int j = 0; j < numColumnas; j++) {
                    XSSFCell hssfCell = (XSSFCell) hssfRow.getCell(j);
                    cellTempList.add(hssfCell);
                }
                boolean esValido = true;
                for (int i = 0; i < numColumnas; i++) {
                    if (cellTempList.get(i) == null) {
                        esValido = false;
                    }
                }
                if (esValido) {
                    cellDataList.add(cellTempList);
                }
            }
            Leer(cellDataList, p, fuente);


        } catch (Exception e) {
            LOGGER.error("ha ocurrido un error", e);
            e.printStackTrace();
        }



    }

    private void Leer(List cellDataList, Proceso pr, String fuente) {
        boolean sapo = false; //avisa si ha ocurrido un error de validación
        String errores = "";
        for (int i = 1; i < cellDataList.size(); i++) { //recorre las filas
            personaExistente = false;
            Persona p = new Persona();
            Estudiante e = new Estudiante();
            Docente doc = new Docente();
            Egresado egr = new Egresado();
            Administrativo adm = new Administrativo();
            Directorprograma dpro = new Directorprograma();
            Empleador emp = new Empleador();
            List cellTempList = (List) cellDataList.get(i);
            for (int j = 0; j < cellTempList.size(); j++) {//recorre las celdas
                XSSFCell hssfCell = (XSSFCell) cellTempList.get(j);
                if (j == 0) {// identificacion
                    DataFormatter formatter = new DataFormatter();
                    try {
                        String aux = "";
                        aux = formatter.formatCellValue(hssfCell);

                        if (!aux.equals("0")) {
                            p = personaFacade.find(aux);
                            if (p == null) {
                                p = new Persona();
                                p.setId(aux);
                                p.setPassword(aux);
                            } else {
                                personaExistente = true;
                            }


                        } else {
                            errores += "<br/>ha ocurrido un error de validación con la identificación en el registro #" + (i + 1);
                            sapo = true;
                        }

                    } catch (Exception exc0) {
                        LOGGER.error("ha ocurrido un error de validación con la identificación en el registro #" + (i + 1), exc0);
                        errores += "<br/>ha ocurrido un error de validación con la identificación en el registro #" + (i + 1);
                        sapo = true;
                    }


                } else if (j == 1 && !personaExistente) {//nombre
                    try {
                        if (hssfCell != null && !hssfCell.toString().equals("")) {
                            p.setNombre(hssfCell.toString());
                            p.setMail("mail@gmail.com");
                        } else {
                            errores += "<br/>ha ocurrido un error de validación con el nombre en el registro #" + (i + 1);
                            sapo = true;
                        }
                    } catch (Exception exc2) {
                        LOGGER.error("ha ocurrido un error de validación con la identificación en el registro #" + (i + 1), exc2);
                        errores += "<br/>ha ocurrido un error de validación con el nombre en el registro #" + (i + 1);
                        sapo = true;
                    }
                } else if (j == 2 && !personaExistente) {//nombre
                    try {
                        if (hssfCell != null && !hssfCell.toString().equals("")) {
                            p.setApellido(hssfCell.toString());
                            p.setMail("mail@gmail.com");
                        } else {
                            errores += "<br/>ha ocurrido un error de validación con el nombre en el registro #" + (i + 1);
                            sapo = true;
                        }
                    } catch (Exception exc2) {
                        LOGGER.error("ha ocurrido un error de validación con la identificación en el registro #" + (i + 1), exc2);
                        errores += "<br/>ha ocurrido un error de validación con el nombre en el registro #" + (i + 1);
                        sapo = true;
                    }
                } else if (j == 3) {
                    try {
                        if (!hssfCell.toString().equals("")) {
                            if (fuente.equals("Estudiante")) {
                                e.setSemestre(hssfCell.toString());
                            } else if (fuente.equals("Docente")) {
                                doc.setTipo(hssfCell.toString());
                            } else if (fuente.equals("Administrativo")) {
                                adm.setCargo(hssfCell.toString());
                            } else if (fuente.equals("Empleador")) {
                                emp.setEmpresa(hssfCell.toString());
                            }
                        } else {
                            errores += "<br/>ha ocurrido un error de validación con el curso en el registro #" + (i + 1);
                            sapo = true;
                        }
                    } catch (Exception ex3) {
                        LOGGER.error("ha ocurrido un error de validación con la identificación en el registro #" + (i + 1), ex3);
                        errores += "<br/>ha ocurrido un error de validación con el apellido en el registro #" + (i + 1);
                        sapo = true;
                    }
                } else if (j == 4) {//tipo
                    try {
                        if (fuente.equals("Empleador")) {
                            emp.setCargo(hssfCell.toString());
                        }
                    } catch (Exception exc) {
                        LOGGER.error("ha ocurrido un error de validación con la identificación en el registro #" + (i + 1), exc);
                        errores += "<br/>ha ocurrido un error de validación con el semestre en el registro #" + (i + 1);
                        sapo = true;
                    }
                }

            }
            if (p.getId() != null) {
                if (!personaExistente) {
                    personaFacade.create(p);
                    p = personaFacade.find(p.getId());
                }
                if (fuente.equals("Estudiante")) {
                    Estudiante aux = estudianteFacade.findBySingle2("procesoId", pr, "personaId", p);
                    if (!personaExistente || aux == null) {
                        e.setPersonaId(p);
                        e.setId("" + pr.getId() + "-" + p.getId());
                        e.setAnio("2016");
                        e.setPeriodo("01");
                        e.setProcesoId(pr);
                        e.setProgramaId(pr.getProgramaId());
                        e.setFuenteId(fuenteFacade.find(1));
                        estudianteFacade.create(e);
                    }
                } else if (fuente.equals("Docente")) {
                    Docente aux = docenteFacade.findBySingle2("procesoId", pr, "personaId", p);
                    if (!personaExistente || aux == null) {
                        doc.setPersonaId(p);
                        doc.setProcesoId(pr);
                        doc.setProgramaId(pr.getProgramaId());
                        doc.setFuenteId(fuenteFacade.find(2));
                        docenteFacade.create(doc);
                    }
                } else if (fuente.equals("Egresado")) {
                    Egresado aux = egresadoFacade.findBySingle2("procesoId", pr, "personaId", p);
                    if (!personaExistente || aux == null) {
                        egr.setPersonaId(p);
                        egr.setProcesoId(pr);
                        egr.setProgramaId(pr.getProgramaId());
                        egr.setFuenteId(fuenteFacade.find(4));
                        egresadoFacade.create(egr);
                    }
                } else if (fuente.equals("Administrativo")) {
                    Administrativo aux = administrativoFacade.findBySingle2("procesoId", pr, "personaId", p);
                    if (!personaExistente || aux == null) {
                        adm.setPersonaId(p);
                        adm.setProcesoId(pr);
                        adm.setProgramaId(pr.getProgramaId());
                        adm.setFuenteId(fuenteFacade.find(3));
                        administrativoFacade.create(adm);
                    }
                } else if (fuente.equals("Empleador")) {
                    Empleador aux = empleadorFacade.findBySingle2("procesoId", pr, "personaId", p);
                    if (!personaExistente || aux == null) {
                        emp.setPersonaId(p);
                        emp.setProcesoId(pr);
                        emp.setProgramaId(pr.getProgramaId());
                        emp.setFuenteId(fuenteFacade.find(6));
                        empleadorFacade.create(emp);
                    }
                } else if (fuente.equals("Directivo")) {
                    Directorprograma aux = directorprogramaFacade.findBySingle2("procesoId", pr, "personaId", p);
                    if (!personaExistente || aux == null) {
                        dpro.setPersonaId(p);
                        dpro.setProcesoId(pr);
                        dpro.setProgramaId(pr.getProgramaId());
                        dpro.setFuenteId(fuenteFacade.find(5));
                        directorprogramaFacade.create(dpro);
                    }
                }

            }

        } //termina la hoja actual

        if (sapo) {
            errorGlobal = sapo;
            out.print("{\"errores\":\"" + errores + "\"}");
        }
    }

    private PersonaFacade lookupPersonaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (PersonaFacade) c.lookup("java:global/sap/PersonaFacade!com.sap.ejb.PersonaFacade");
        } catch (NamingException ne) {
            LOGGER.error("exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private FuenteFacade lookupFuenteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (FuenteFacade) c.lookup("java:global/sap/FuenteFacade!com.sap.ejb.FuenteFacade");
        } catch (NamingException ne) {
            LOGGER.error("exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private EstudianteFacade lookupEstudianteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EstudianteFacade) c.lookup("java:global/sap/EstudianteFacade!com.sap.ejb.EstudianteFacade");
        } catch (NamingException ne) {
            LOGGER.error("exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private DocenteFacade lookupDocenteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (DocenteFacade) c.lookup("java:global/sap/DocenteFacade!com.sap.ejb.DocenteFacade");
        } catch (NamingException ne) {
            java.util.logging.Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private EgresadoFacade lookupEgresadoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EgresadoFacade) c.lookup("java:global/sap/EgresadoFacade!com.sap.ejb.EgresadoFacade");
        } catch (NamingException ne) {
            java.util.logging.Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private AdministrativoFacade lookupAdministrativoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (AdministrativoFacade) c.lookup("java:global/sap/AdministrativoFacade!com.sap.ejb.AdministrativoFacade");
        } catch (NamingException ne) {
            java.util.logging.Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private DirectorprogramaFacade lookupDirectorprogramaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (DirectorprogramaFacade) c.lookup("java:global/sap/DirectorprogramaFacade!com.sap.ejb.DirectorprogramaFacade");
        } catch (NamingException ne) {
            java.util.logging.Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private EmpleadorFacade lookupEmpleadorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EmpleadorFacade) c.lookup("java:global/sap/EmpleadorFacade!com.sap.ejb.EmpleadorFacade");
        } catch (NamingException ne) {
            java.util.logging.Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}