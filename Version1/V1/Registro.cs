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
    public partial class Registro : Form
    {
        Socket servidor;
        IPAddress ip;
        int port;
        IPEndPoint endpoint;
        private const string serverIp = "192.168.56.102"; // IP del servidor
        private const int serverPort = 8080; // Puerto del servidor
        private TcpClient client;

        public Registro()
        {
            InitializeComponent();
        }

        public void set_ip(IPAddress ipadd)
        {
            ip = ipadd;
        }

        public void set_port(int port)
        {
            this.port = port;
        }

        private void Registro_Load(object sender, EventArgs e)
        {
            contrabox.Text = "";
            contrabox.MaxLength = 20;
            contrabox.PasswordChar = '·';
            usuariobox.Text = "";
            usuariobox.MaxLength = 20;
            endpoint = new IPEndPoint(ip, port);
        }

        private void registro_button_Click(object sender, EventArgs e)
        {
            string username = usuariobox.Text;
            string password = contrabox.Text;
            string email = correobox.Text;
            string birthdate = fechabox.Text;

            string request = $"3/{username}/{password}/{email}/{birthdate}";
            string response = SendRequest(request);
            MessageBox.Show(response);
            Close();
        }


        // Método para enviar la solicitud al servidor
        private string SendRequest(string request)
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

        private void label4_Click(object sender, EventArgs e)
        {

        }
    }
}

