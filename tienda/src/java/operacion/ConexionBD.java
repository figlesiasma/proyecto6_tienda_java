/*
 * CLASE CONEXIÓN A LA BD
 */
package operacion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;
/**
 *
 * @author felip
 */
public class ConexionBD {
    public ConexionBD(){
    };
    
    public Connection conectar() {
        Connection conexion=null;
        try {
            Class.forName("org.gjt.mm.mysql.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/tienda","root","");
        } catch (ClassNotFoundException  e) {
            JOptionPane.showConfirmDialog(null, e);
        } catch (SQLException e){
            JOptionPane.showConfirmDialog(null, e);
        }
        return conexion;
    }
}
