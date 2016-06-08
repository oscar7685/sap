package com.sap.utils;

import com.sap.ejb.EstudianteFacade;
import com.sap.ejb.FuenteFacade;
import com.sap.ejb.PersonaFacade;
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
import java.util.logging.Logger;
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

public class LectorXLSX {

    EstudianteFacade estudianteFacade = lookupEstudianteFacadeBean();
    FuenteFacade fuenteFacade = lookupFuenteFacadeBean();
    PersonaFacade personaFacade = lookupPersonaFacadeBean();
    PrintWriter out;
    public boolean errorGlobal = false;
    public boolean personaExistente = false;

    public LectorXLSX(File fileName, Proceso p, HttpServletResponse response, String fuente) throws ParseException, IOException {
        out = response.getWriter();
        if (fuente.equals("Estudiante")) {
            try {
                FileInputStream fileInputStream = new FileInputStream(fileName);
                XSSFWorkbook workBook = new XSSFWorkbook(fileInputStream);
                List cellDataList = new ArrayList();
                XSSFSheet hssfSheet = workBook.getSheetAt(0);
                Iterator rowIterator = hssfSheet.rowIterator();
                while (rowIterator.hasNext()) {
                    XSSFRow hssfRow = (XSSFRow) rowIterator.next();
                    List cellTempList = new ArrayList();//lista Temporal para agregar cada uno de los 6 datos de una fila
                    for (int j = 0; j < 4; j++) {
                        XSSFCell hssfCell = (XSSFCell) hssfRow.getCell(j);
                        cellTempList.add(hssfCell);
                    }
                    if (!((cellTempList.get(0) == null)
                            && (cellTempList.get(1) == null)
                            && (cellTempList.get(2) == null)
                            && (cellTempList.get(3) == null))) {
                        cellDataList.add(cellTempList);
                    }
                }
                Leer(cellDataList, 0, p);


            } catch (Exception e) {
                System.out.println("error aqui");
                e.printStackTrace();
            }
        }


    }

    private void Leer(List cellDataList, int i0, Proceso pr) {
        boolean sapo = false; //avisa si ha ocurrido un error de validación
        String errores = "";
        List<Persona> personas = new ArrayList<Persona>();
        List<Estudiante> estudiantes = new ArrayList<Estudiante>();
        for (int i = 1; i < cellDataList.size(); i++) {
            Persona p = new Persona();
            Estudiante e = new Estudiante();
            List cellTempList = (List) cellDataList.get(i);
            for (int j = 0; j < cellTempList.size(); j++) {
                personaExistente = false;
                XSSFCell hssfCell = (XSSFCell) cellTempList.get(j);
                if (i0 == 0) {
                    if (j == 0) {// identificacion
                        try {
                            String aux = "" + new BigDecimal(Double.valueOf(hssfCell.getNumericCellValue())).toPlainString();

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
                            errores += "<br/>ha ocurrido un error de validación con la identificación en el registro #" + (i + 1);
                            sapo = true;
                        }


                    } else if (j == 2 && !personaExistente) {//nombre
                        try {
                            if (!hssfCell.toString().equals("")) {
                                p.setNombre(hssfCell.toString());
                                p.setApellido(".");
                                p.setMail("mail@gmail.com");
                            } else {
                                errores += "<br/>ha ocurrido un error de validación con el nombre en el registro #" + (i + 1);
                                sapo = true;
                            }
                        } catch (Exception exc2) {
                            errores += "<br/>ha ocurrido un error de validación con el nombre en el registro #" + (i + 1);
                            sapo = true;
                        }
                    } else if (j == 3 && !personaExistente) {//curso
                        try {
                            if (!hssfCell.toString().equals("")) {
                                e.setCurso(hssfCell.toString());

                            } else {
                                errores += "<br/>ha ocurrido un error de validación con el curso en el registro #" + (i + 1);
                                sapo = true;
                            }
                        } catch (Exception ex3) {

                            errores += "<br/>ha ocurrido un error de validación con el apellido en el registro #" + (i + 1);
                            sapo = true;
                        }
                    } else if (j == 4) {//tipo
                        try {
                            e.setTipo(hssfCell.toString());
                        } catch (Exception exc) {
                            errores += "<br/>ha ocurrido un error de validación con el semestre en el registro #" + (i + 1);
                            sapo = true;
                        }
                    }
                }
            }

            if (i0 == 0) {
                if (p.getId() != null) {
                    if (!personaExistente) {
                        personaFacade.create(p);
                    }
                    p = personaFacade.find(p.getId());
                    e.setPersonaId(p);
                    e.setId("" + pr.getId() + "-" + p.getId());
                    e.setAnio("2016");
                    e.setPeriodo("01");
                    e.setSemestre("03");
                    e.setProcesoId(pr);
                    e.setProgramaId(pr.getProgramaId());
                    String tipo = e.getTipo();
                    if (tipo.equals("OFICIALES") || tipo.equals("CADETES")) {
                        e.setFuenteId(fuenteFacade.find(1));
                    } else if (tipo.equals("MAESTRIA")) {
                        e.setFuenteId(fuenteFacade.find(8));
                    } else if (tipo.equals("ESPECIALIZACION")) {
                        e.setFuenteId(fuenteFacade.find(7));
                    }
                    estudianteFacade.create(e);
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
            return (PersonaFacade) c.lookup("java:global/sapnaval/PersonaFacade!com.sap.ejb.PersonaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private FuenteFacade lookupFuenteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (FuenteFacade) c.lookup("java:global/sapnaval/FuenteFacade!com.sap.ejb.FuenteFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private EstudianteFacade lookupEstudianteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EstudianteFacade) c.lookup("java:global/sapnaval/EstudianteFacade!com.sap.ejb.EstudianteFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}