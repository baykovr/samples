using InputManager;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;

using System.Windows.Forms;

namespace rapidClicker
{
    public partial class MainForm : Form
    {
        bool RUNNING   = false;
        int PRESS_DELAY = 100;

        public MainForm()
        {
            InitializeComponent();
            this.FormBorderStyle = FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;

            // Readme or spam the user? I think readme.
            //string welcome_msg = "";
            //welcome_msg += "Rapid clicker can left click fast\n\n";
            //welcome_msg += "To exit the application at any time press ESC.\n";
            //welcome_msg += "Use the Left CTRL key to toggle clicking.\n\n";
            //welcome_msg += "Happy clicking.";
            //MessageBox.Show(welcome_msg,"Before you start.");

            register_hooks();
        }
        
        void register_hooks()
        {
            KeyboardHook.KeyDown += new KeyboardHook.KeyDownEventHandler(KeyboardHook_KeyDown);
            KeyboardHook.InstallHook();
        }

        public void run()
        {
            while (RUNNING == true)
            {
                Mouse.PressButton(Mouse.MouseKeys.Left);
                System.Threading.Thread.Sleep(PRESS_DELAY);
            }
        }

        void KeyboardHook_KeyDown(int vkCode)
        {
            // https://msdn.microsoft.com/en-us/library/windows/desktop/dd375731(v=vs.85).aspx
            if (vkCode == 0xA2) // L CTRL
            {
                toggleRun();
            }
            if (vkCode == 0x1B) // ESC
            {
                this.Close();
            }
        }

        private void btnStart_Click(object sender, EventArgs e)
        {
            toggleRun();
        }
        private bool validateDelay()
        {
            System.Windows.Forms.ToolTip myToolTip = new System.Windows.Forms.ToolTip();
            int specifiedDelay;
            if (!int.TryParse(txtClicksPerSecond.Text, out specifiedDelay))
            {
                myToolTip.Show("Invalid delay input.", txtClicksPerSecond);
                return false;
            }
            else
            {
                // Additional contraints
                if (specifiedDelay < 0)
                {
                    myToolTip.Show("Delay cannot be negative", txtClicksPerSecond);
                    return false;
                }
                else
                {
                    PRESS_DELAY = specifiedDelay;
                    return true;
                }
            }
        }
        private void toggleRun()
        {
            // Handle toggle behavior.
            if (validateDelay())
            {
                if (RUNNING)
                {
                    btnStart.Text = "Run : Press Left CTRL";
                    txtClicksPerSecond.Enabled = true;
                    RUNNING = false;
                }
                else
                {
                    // set new delay & spawn a click thread.
                    txtClicksPerSecond.Enabled = false;
                    btnStart.Text = "Stop : Press Left CTRL";

                    RUNNING = true;
                    System.Threading.ThreadPool.QueueUserWorkItem(delegate
                    {
                        run();
                    }, null);
                }
            }
        }

        private void lblAbout_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("https://baykovr.github.io");
            lblAbout.Enabled = false;
        }
    }
}
