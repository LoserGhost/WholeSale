/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author LoserGhost
 */
public class Branch {

    private String branch_ID;
    private String branch_Name;
    private String branch_Location;

    public Branch() {
    }

    public String getBranch_ID() {
        return branch_ID;
    }

    public void setBranch_ID(String branch_ID) {
        this.branch_ID = branch_ID;
    }

    public String getBranch_Name() {
        return branch_Name;
    }

    public void setBranch_Name(String branch_Name) {
        this.branch_Name = branch_Name;
    }

    public String getBranch_Location() {
        return branch_Location;
    }

    public void setBranch_Location(String branch_Location) {
        this.branch_Location = branch_Location;
    }

}
