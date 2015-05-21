package observatory;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import static java.lang.System.out;
import java.sql.*;

/**
 *
 * @author Jaime Acevedo
 *
 * @version 1.0
 *
 *
 */
public class Proposal extends DatabaseManager{
    
    String START_DATE;
    String START_TIME;
    String TARGET;
    String ID;
    String RA;
    String DC;
    String ANGLE;
    String REPEAT;
    String FRAME;
    String FILTER;
    String EXPOSURE;
    String BINNING;
    String COUNT;
    int REQUEST_ID;
    
    public boolean isScheduled;

    public Proposal() {
        isScheduled = false;
    }


    public String getSTART_DATE() {
        return START_DATE;
    }

    public String getSTART_TIME() {
        return START_TIME;
    }

    public String getTARGET() {
        return TARGET;
    }

    public String getID() {
        return ID;
    }

    public String getRA() {
        return RA;
    }

    public String getDC() {
        return DC;
    }

    public String getANGLE() {
        return ANGLE;
    }

    public String getREPEAT() {
        return REPEAT;
    }

    public String getFRAME() {
        return FRAME;
    }

    public String getFILTER() {
        return FILTER;
    }

    public String getEXPOSURE() {
        return EXPOSURE;
    }

    public String getBINNING() {
        return BINNING;
    }

    public String getCOUNT() {
        return COUNT;
    }
    
    public int getRequestID(){
        return REQUEST_ID;
    }

    public void setSTART_DATE(String START_DATE) {
        this.START_DATE = START_DATE;
    }

    public void setSTART_TIME(String START_TIME) {
        this.START_TIME = START_TIME;
    }

    public void setTARGET(String TARGET) {
        this.TARGET = TARGET;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public void setRA(String RA) {
        this.RA = RA;
    }

    public void setDC(String DC) {
        this.DC = DC;
    }

    public void setANGLE(String ANGLE) {
        this.ANGLE = ANGLE;
    }

    public void setREPEAT(String REPEAT) {
        this.REPEAT = REPEAT;
    }

    public void setFRAME(String FRAME) {
        this.FRAME = FRAME;
    }

    public void setFILTER(String FILTER) {
        this.FILTER = FILTER;
    }

    public void setEXPOSURE(String EXPOSURE) {
        this.EXPOSURE = EXPOSURE;
    }

    public void setBINNING(String BINNING) {
        this.BINNING = BINNING;
    }

    public void setCOUNT(String COUNT) {
        this.COUNT = COUNT;
    }
    
    public void setREQUESTID(int requestID){
       REQUEST_ID = requestID;
    }

    
    @Override
    public String toString(){
        String newString = "START_DATE :" + this.getSTART_DATE() +" "
                          + "START_TIME :" + this.getSTART_TIME() + " "
                          + "TARGET :" + this.getTARGET() + " "
                          + "ID :" + this.getID() + " "
                          + "RA :" + this.getRA() + " " 
                          + "DC :" + this.getDC() + " "
                          + "ANGLE :" + this.getANGLE() + " "
                          + "REPEAT :" + this.getREPEAT() + " "
                          + "FRAME :" + this.getFRAME() + " "
                          + "FILTER :" + this.getFILTER() + " " 
                          + "EXPOSURE :" + this.getEXPOSURE() + " "
                          + "BINNING :" + this.getBINNING() + " "
                          + "COUNT :" + this.getCOUNT();
                          
     

    return newString;
    
    
}
    
}
