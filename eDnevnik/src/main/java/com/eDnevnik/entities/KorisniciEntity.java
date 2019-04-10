package com.eDnevnik.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="korisnici")
public class KorisniciEntity {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id_korisnika;
    
    @Column(nullable = false)
    private String ime;
    
    @Column(nullable = false)
    private String prezime;
    
    @Column(nullable = false, unique = true)
    private String username;
    
    
    
}
