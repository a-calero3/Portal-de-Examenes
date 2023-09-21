package com.sistema.examenes.entidades;

import jakarta.persistence.*;

@Entity
public class UsuarioRol {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long usuarioRolId;

    @ManyToMany(fetch =  FetchType.EAGER)
    private Usuario usuario;

    @ManyToMany()
    private Rol rol;
}
