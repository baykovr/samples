namespace rapidClicker
{
    partial class MainForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            this.btnStart = new System.Windows.Forms.Button();
            this.lblClickDelay = new System.Windows.Forms.Label();
            this.txtClicksPerSecond = new System.Windows.Forms.TextBox();
            this.lblHint = new System.Windows.Forms.Label();
            this.lblAbout = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // btnStart
            // 
            this.btnStart.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnStart.Location = new System.Drawing.Point(278, 18);
            this.btnStart.Name = "btnStart";
            this.btnStart.Size = new System.Drawing.Size(150, 23);
            this.btnStart.TabIndex = 0;
            this.btnStart.Text = "Run : Press Left CTRL";
            this.btnStart.UseVisualStyleBackColor = true;
            this.btnStart.Click += new System.EventHandler(this.btnStart_Click);
            // 
            // lblClickDelay
            // 
            this.lblClickDelay.AutoSize = true;
            this.lblClickDelay.Location = new System.Drawing.Point(12, 21);
            this.lblClickDelay.Name = "lblClickDelay";
            this.lblClickDelay.Size = new System.Drawing.Size(171, 13);
            this.lblClickDelay.TabIndex = 1;
            this.lblClickDelay.Text = "Delay between clicks (miliseconds)";
            // 
            // txtClicksPerSecond
            // 
            this.txtClicksPerSecond.Location = new System.Drawing.Point(189, 18);
            this.txtClicksPerSecond.Name = "txtClicksPerSecond";
            this.txtClicksPerSecond.Size = new System.Drawing.Size(83, 20);
            this.txtClicksPerSecond.TabIndex = 2;
            this.txtClicksPerSecond.Text = "100";
            // 
            // lblHint
            // 
            this.lblHint.AutoSize = true;
            this.lblHint.Location = new System.Drawing.Point(12, 58);
            this.lblHint.Name = "lblHint";
            this.lblHint.Size = new System.Drawing.Size(241, 13);
            this.lblHint.TabIndex = 3;
            this.lblHint.Text = "You can exit at any time by pressing the ESC key.";
            // 
            // lblAbout
            // 
            this.lblAbout.AutoSize = true;
            this.lblAbout.ForeColor = System.Drawing.Color.DodgerBlue;
            this.lblAbout.Location = new System.Drawing.Point(335, 58);
            this.lblAbout.Name = "lblAbout";
            this.lblAbout.Size = new System.Drawing.Size(88, 13);
            this.lblAbout.TabIndex = 4;
            this.lblAbout.Text = "baykovr.github.io";
            this.lblAbout.Click += new System.EventHandler(this.lblAbout_Click);
            // 
            // MainForm
            // 
            this.AcceptButton = this.btnStart;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(435, 80);
            this.Controls.Add(this.lblAbout);
            this.Controls.Add(this.lblHint);
            this.Controls.Add(this.txtClicksPerSecond);
            this.Controls.Add(this.lblClickDelay);
            this.Controls.Add(this.btnStart);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "MainForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Rapid Clicker";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnStart;
        private System.Windows.Forms.Label lblClickDelay;
        private System.Windows.Forms.TextBox txtClicksPerSecond;
        private System.Windows.Forms.Label lblHint;
        private System.Windows.Forms.Label lblAbout;
    }
}

