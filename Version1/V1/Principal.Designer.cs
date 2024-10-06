namespace V1
{
    partial class Principal
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
            this.txtResponse = new System.Windows.Forms.RichTextBox();
            this.btnWins = new System.Windows.Forms.Button();
            this.btnLosses = new System.Windows.Forms.Button();
            this.btnListPlayers = new System.Windows.Forms.Button();
            this.textprincipal1 = new System.Windows.Forms.RichTextBox();
            this.closebutton = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // txtResponse
            // 
            this.txtResponse.Font = new System.Drawing.Font("Constantia", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtResponse.Location = new System.Drawing.Point(337, 111);
            this.txtResponse.Margin = new System.Windows.Forms.Padding(2);
            this.txtResponse.Name = "txtResponse";
            this.txtResponse.ReadOnly = true;
            this.txtResponse.Size = new System.Drawing.Size(228, 116);
            this.txtResponse.TabIndex = 14;
            this.txtResponse.Text = "";
            // 
            // btnWins
            // 
            this.btnWins.Location = new System.Drawing.Point(112, 57);
            this.btnWins.Margin = new System.Windows.Forms.Padding(2);
            this.btnWins.Name = "btnWins";
            this.btnWins.Size = new System.Drawing.Size(113, 38);
            this.btnWins.TabIndex = 15;
            this.btnWins.Text = "Wins";
            this.btnWins.UseVisualStyleBackColor = true;
            this.btnWins.Click += new System.EventHandler(this.btnWins_Click);
            // 
            // btnLosses
            // 
            this.btnLosses.Location = new System.Drawing.Point(112, 152);
            this.btnLosses.Margin = new System.Windows.Forms.Padding(2);
            this.btnLosses.Name = "btnLosses";
            this.btnLosses.Size = new System.Drawing.Size(113, 38);
            this.btnLosses.TabIndex = 16;
            this.btnLosses.Text = "Defeats";
            this.btnLosses.UseVisualStyleBackColor = true;
            this.btnLosses.Click += new System.EventHandler(this.btnLosses_Click);
            // 
            // btnListPlayers
            // 
            this.btnListPlayers.Location = new System.Drawing.Point(112, 262);
            this.btnListPlayers.Margin = new System.Windows.Forms.Padding(2);
            this.btnListPlayers.Name = "btnListPlayers";
            this.btnListPlayers.Size = new System.Drawing.Size(113, 37);
            this.btnListPlayers.TabIndex = 17;
            this.btnListPlayers.Text = "Players";
            this.btnListPlayers.UseVisualStyleBackColor = true;
            this.btnListPlayers.Click += new System.EventHandler(this.btnListPlayers_Click);
            // 
            // textprincipal1
            // 
            this.textprincipal1.BackColor = System.Drawing.SystemColors.HighlightText;
            this.textprincipal1.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textprincipal1.Font = new System.Drawing.Font("Constantia", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textprincipal1.Location = new System.Drawing.Point(258, 11);
            this.textprincipal1.Margin = new System.Windows.Forms.Padding(2);
            this.textprincipal1.Name = "textprincipal1";
            this.textprincipal1.ReadOnly = true;
            this.textprincipal1.Size = new System.Drawing.Size(221, 21);
            this.textprincipal1.TabIndex = 18;
            this.textprincipal1.Text = "";
            // 
            // closebutton
            // 
            this.closebutton.Location = new System.Drawing.Point(572, 273);
            this.closebutton.Margin = new System.Windows.Forms.Padding(2);
            this.closebutton.Name = "closebutton";
            this.closebutton.Size = new System.Drawing.Size(91, 37);
            this.closebutton.TabIndex = 19;
            this.closebutton.Text = "Cerrar Sesión";
            this.closebutton.UseVisualStyleBackColor = true;
            this.closebutton.Click += new System.EventHandler(this.closebutton_Click);
            // 
            // Principal
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = global::V1.Properties.Resources.imagenfondo;
            this.ClientSize = new System.Drawing.Size(674, 336);
            this.Controls.Add(this.closebutton);
            this.Controls.Add(this.textprincipal1);
            this.Controls.Add(this.btnListPlayers);
            this.Controls.Add(this.btnLosses);
            this.Controls.Add(this.btnWins);
            this.Controls.Add(this.txtResponse);
            this.Name = "Principal";
            this.Text = "Principal";
            this.Load += new System.EventHandler(this.Principal_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.RichTextBox txtResponse;
        private System.Windows.Forms.Button btnWins;
        private System.Windows.Forms.Button btnLosses;
        private System.Windows.Forms.Button btnListPlayers;
        private System.Windows.Forms.RichTextBox textprincipal1;
        private System.Windows.Forms.Button closebutton;
    }
}