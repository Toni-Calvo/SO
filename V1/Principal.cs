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
    public partial class Principal : Form
    {
        Socket servidor;
        IPAddress ip;
        string nombre_usuario;
        int port;
        IPEndPoint endpoint;
        private const string serverIp = "192.168.56.102"; // IP del servidor
        private const int serverPort = 8080; // Puerto del servidor
        private TcpClient client;
        public Principal()
        {
            InitializeComponent();
        }

        private void Principal_Load(object sender, EventArgs e)
        {
            IPAddress ip = IPAddress.Parse("192.168.56.102");
            endpoint = new IPEndPoint(ip, 35678);
        }
        public void set_ip(IPAddress ipadd)
        {
            ip = ipadd;
        }
        public void set_port(int port)
        {
            this.port = port;
        }

        public void set_nombre_usuario(string usuario)
        {
            nombre_usuario = usuario;
            textprincipal1.Text = "Bienvenido/a " + usuario;
        }

        private void btnWins_Click(object sender, EventArgs e)
        {
            string username = nombre_usuario;
            string request = $"4/{username}";
            string response = SendRequest(request);
            txtResponse.Text = response;
        }

        private void btnLosses_Click(object sender, EventArgs e)
        {
            string username = nombre_usuario;
            string request = $"5/{username}";
            string response = SendRequest(request);
            txtResponse.Text = response;
        }

        private void btnListPlayers_Click(object sender, EventArgs e)
        {
            string request = "6/";
            string response = SendRequest(request);
            txtResponse.Text = response;
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

        private void closebutton_Click(object sender, EventArgs e)
        {
            this.Hide();
            LogIn login = new LogIn();
            login.Show();
        }
    }
}
