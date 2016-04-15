/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package operacion;

import modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import modelo.Administrador;

/**
 *
 * @author felip
 */
public class Operaciones {
    private ConexionBD mysql = new ConexionBD();
    private Connection cn = mysql.conectar();
    private String sql = "";
    
    
    public void mostrar (ArrayList lista){
        sql = "select * from usuario";
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()){
                Usuario user = new Usuario();
                user.setId(rs.getInt("usu_id"));
                user.setDni(rs.getString("usu_dni"));
                user.setPassword(rs.getString("usu_password"));
                user.setNombre(rs.getString("usu_nombre"));
                user.setEmail(rs.getString("usu_email"));
                user.setActivo(rs.getInt("usu_activo"));
                lista.add(user);
            }
            
        }catch(Exception e){
            
        }
    }
    
     
    public boolean insertar (Usuario user){
        
        sql = "INSERT INTO `usuario`(`usu_dni`, `usu_password`, `usu_nombre`, `usu_email`, `usu_activo`) VALUES (?,?,?,?,?)"; 
        
        try {
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, user.getDni());
            pst.setString(2, user.getPassword());
            pst.setString(3, user.getNombre());
            pst.setString(4, user.getEmail());
            pst.setInt(5, user.getActivo());
            
            int n = pst.executeUpdate();
            if (n != 0){
                return true;
            }else{
                return false;
            }
        }catch(Exception e){
            return false;
        }
    }
    
    public boolean insertarAdm (Administrador user){
        sql = "INSERT INTO `administrador`(`adm_nombre`, `adm_dni`, `adm_password`, `rol_id`, `adm_email`, `adm_activo`) VALUES (?,?,?,?,?,?)";
           
        try {
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, user.getNombre());
            pst.setString(2, user.getDni());
            pst.setString(3, user.getPassword());
            pst.setInt(4, user.getRol_id());
            pst.setString(5, user.getEmail());
            pst.setInt(6, user.getActivo());
            
            int n = pst.executeUpdate();
            if (n != 0){
                return true;
            }else{
                return false;
            }
        }catch(Exception e){
            return false;
        }
    }
    
    public boolean editar (Usuario user){
        sql = "UPDATE `usuario` SET `usu_dni`=?,`usu_password`=?,`usu_nombre`=?,`usu_email`=? WHERE id=?";
        try {
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, user.getDni());
            pst.setString(2, user.getPassword());
            pst.setString(3, user.getNombre());
            pst.setString(4, user.getEmail());
            pst.setInt(6, user.getId());
            
            int n = pst.executeUpdate();
            if (n != 0){
                return true;
            }else{
                return false;
            }
        }catch(Exception e){
            return false;
        }
    }
    
    public boolean activarDesactivarUsuario (Usuario user){
        if (user.getActivo()==1) {
            sql = "UPDATE `usuario` SET `usu_activo`=0 WHERE id=?";
        }else{
            sql = "UPDATE `usuario` SET `usu_activo`=1 WHERE id=?";
        } 
        try {
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, user.getId());    
            int n = pst.executeUpdate();
            if (n != 0){
                return true;
            }else{
                return false;
            }
        }catch(Exception e){
            return false;
        }
    }
    
    public boolean validar(String user, String pass, boolean nivel) {
        boolean estado = false;
        try {
            if(nivel){
                sql="select * from administrador where adm_dni=? and adm_password=?"; 
            }else{
                sql="select * from usuario where usu_dni=? and usu_password=?"; 
            }

            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();   
            estado = rs.next();
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return estado;
    }
    
    public boolean comprobarActivo(int valorActivo){
        if(valorActivo==0){
            return false;
        }
        return true;
    }
   
  
}
