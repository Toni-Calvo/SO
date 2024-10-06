namespace V1
{
    partial class Registro
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.usuariobox = new System.Windows.Forms.TextBox();
            this.correobox = new System.Windows.Forms.TextBox();
            this.contrabox = new System.Windows.Forms.TextBox();
            this.fechabox = new System.Windows.Forms.TextBox();
            this.registro_button = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(112, 53);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(86, 13);
            this.label1.TabIndex = 4;
            this.label1.Text = "Nombre Usuario:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(112, 94);
            this.label2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(97, 13);
            this.label2.TabIndex = 5;
            this.label2.Text = "Correo Electrónico:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(112, 139);
            this.label3.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(64, 13);
            this.label3.TabIndex = 6;
            this.label3.Text = "Contraseña:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(112, 182);
            this.label4.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(178, 13);
            this.label4.TabIndex = 7;
            this.label4.Text = "Fecha de Naciemient (aaaa-mm-dd):";
            this.label4.Click += new System.EventHandler(this.label4_Click);
            // 
            // usuariobox
            // 
            this.usuariobox.Location = new System.Drawing.Point(115, 71);
            this.usuariobox.Name = "usuariobox";
            this.usuariobox.Size = new System.Drawing.Size(100, 20);
            this.usuariobox.TabIndex = 8;
            // 
            // correobox
            // 
            this.correobox.Location = new System.Drawing.Point(115, 110);
            this.correobox.Name = "correobox";
            this.correobox.Size = new System.Drawing.Size(100, 20);
            this.correobox.TabIndex = 9;
            // 
            // contrabox
            // 
            this.contrabox.Location = new System.Drawing.Point(115, 159);
            this.contrabox.Name = "contrabox";
            this.contrabox.PasswordChar = '·';
            this.contrabox.Size = new System.Drawing.Size(100, 20);
            this.contrabox.TabIndex = 10;
            // 
            // fechabox
            // 
            this.fechabox.Location = new System.Drawing.Point(115, 207);
            this.fechabox.Name = "fechabox";
            this.fechabox.Size = new System.Drawing.Size(100, 20);
            this.fechabox.TabIndex = 11;
            // 
            // registro_button
            // 
            this.registro_button.Location = new System.Drawing.Point(130, 233);
            this.registro_button.Name = "registro_button";
            this.registro_button.Size = new System.Drawing.Size(68, 23);
            this.registro_button.TabIndex = 12;
            this.registro_button.Text = "Registrar";
            this.registro_button.UseVisualStyleBackColor = true;
            this.registro_button.Click += new System.EventHandler(this.registro_button_Click);
            // 
            // Registro
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.LightPink;
            this.ClientSize = new System.Drawing.Size(337, 329);
            this.Controls.Add(this.registro_button);
            this.Controls.Add(this.fechabox);
            this.Controls.Add(this.contrabox);
            this.Controls.Add(this.correobox);
            this.Controls.Add(this.usuariobox);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "Registro";
            this.Text = "Registro";
            this.Load += new System.EventHandler(this.Registro_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox usuariobox;
        private System.Windows.Forms.TextBox correobox;
        private System.Windows.Forms.TextBox contrabox;
        private System.Windows.Forms.TextBox fechabox;
        private System.Windows.Forms.Button registro_button;
    }
}