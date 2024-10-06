using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using V1;

namespace V1
{
    public partial class LogIn : Form
    {
        private const string serverIp = "192.168.56.102"; // IP del servidor
        private const int serverPort = 8080; // Puerto del servidor
        private TcpClient client;
        IPEndPoint endpoint;
        public LogIn()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            IPAddress ip = IPAddress.Parse("192.168.56.102");
            endpoint = new IPEndPoint(ip, 35678);
        }


        private void btnLogin_Click(object sender, EventArgs e)
        {
            if ((txtUsername.Text == "") || (txtPassword.Text == ""))
                txtResponse.Text = "!Por favor, asegúrese de escribir tanto su nombre de usuario como su contraseña¡";
            else
            { 
                string username = txtUsername.Text;
                string password = txtPassword.Text;

                string request = $"1/{username}/{password}";
                string response = SendRequest(request);
                if (response == "Login")
                {
                    Principal principal = new Principal();
                    principal.set_nombre_usuario(txtUsername.Text);
                    principal.set_ip(endpoint.Address);
                    principal.set_port(endpoint.Port);
                    principal.Show();
                    this.Hide();
                    
                }
                else
                {
                    MessageBox.Show("Asegúrese, por favor, de que los datos están correctamente introducidos.");

                }
            }
        }

        public string SendRequest(string request)
        {
            try
            {
                // Conectar al servidor
                client = new TcpClient(serverIp, serverPort);
                NetworkStream stream = client.GetStream();

                // Enviar solicitud al servidor
                byte[] data = Encoding.ASCII.GetBytes(request);
                stream.Write(data, 0, data.Length);

                // Leer respuesta del servidor
                byte[] buffer = new byte[1024];
                int bytesRead = stream.Read(buffer, 0, buffer.Length);
                string response = Encoding.ASCII.GetString(buffer, 0, bytesRead);

                // Cerrar conexión
                stream.Close();
                client.Close();

                return response;
            }
            catch (Exception ex)
            {
                return $"Error: {ex.Message}";
            }
        }

        private void registrolink_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Registro registro = new Registro();
            registro.set_ip(endpoint.Address);
            registro.set_port(endpoint.Port);
            registro.Show();
        }

        private void txtResponse_TextChanged(object sender, EventArgs e)
        {

        }

        private void closebutton_Click(object sender, EventArgs e)
        {
            Close();
        }
    }
}


