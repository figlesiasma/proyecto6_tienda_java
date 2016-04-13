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
                user.setRol(rs.getInt("usu_id"));
                user.setNombre(rs.getString("usu_nombre"));
                user.setEmail(rs.getString("usu_email"));
                lista.add(user);
            }
        }catch(Exception e){
            
        }
    }
    
    
    
    public boolean insertar (Usuario user){
        sql = "INSERT INTO `usuario`(`usu_dni`, `usu_password`, `rol_id`, `usu_nombre`, `usu_email`) VALUES (?,?,?,?,?)";
        try {
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, user.getDni());
            pst.setString(2, user.getPassword());
            pst.setInt(3, user.getRol());
            pst.setString(4, user.getNombre());
            pst.setString(5, user.getEmail());
            
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
        sql = "UPDATE `usuario` SET `usu_dni`=?,`usu_password`=?,`rol_id`=?,`usu_nombre`=?,`usu_email`=? WHERE id=?";
        try {
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, user.getDni());
            pst.setString(2, user.getPassword());
            pst.setInt(3, user.getRol());
            pst.setString(4, user.getNombre());
            pst.setString(5, user.getEmail());
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
    public boolean desactivar (Usuario user){
        sql = "UPDATE `usuario` SET `usu_activo`=0 WHERE id=?";
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
    
    public boolean activar (Usuario user){
        sql = "UPDATE `usuario` SET `usu_activo`=1 WHERE id=?";
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
    
    public boolean validar(String user, String pass) {
        boolean estado = false;
        try {
            sql="select * from usuario where usu_dni=? and usu_password=?";

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
}
