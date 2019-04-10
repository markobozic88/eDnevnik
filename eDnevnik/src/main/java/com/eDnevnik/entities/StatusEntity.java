package com.eDnevnik.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GeneratorType;

@Entity
@Table(name = "status")
public class StatusEntity {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_statusa;
    private String status; 
    
    public int getIdStatusa(){
        return id_statusa;
    }
    
    public void setIdStatusa(int id_statusa){
        this.id_statusa = id_statusa;
    }
    
    public String getStatus(){
        return status;
    }
    
    public void setStatus(String status){
        this.status = status;
    }

    @Override
    public String toString() {
        return "Status: id_statusa = " + id_statusa + ", status = " + status;
    }
    
}
