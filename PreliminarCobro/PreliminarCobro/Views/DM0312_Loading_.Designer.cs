namespace PreliminarCobro.Views
{
  partial class DM0312_Loading_
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
      System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(DM0312_Loading_));
      this.imgPictureBox = new System.Windows.Forms.PictureBox();
      ((System.ComponentModel.ISupportInitialize)(this.imgPictureBox)).BeginInit();
      this.SuspendLayout();
      // 
      // imgPictureBox
      // 
      this.imgPictureBox.Dock = System.Windows.Forms.DockStyle.Fill;
      this.imgPictureBox.Image = ((System.Drawing.Image)(resources.GetObject("imgPictureBox.Image")));
      this.imgPictureBox.Location = new System.Drawing.Point(0, 0);
      this.imgPictureBox.Name = "imgPictureBox";
      this.imgPictureBox.Size = new System.Drawing.Size(200, 200);
      this.imgPictureBox.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
      this.imgPictureBox.TabIndex = 0;
      this.imgPictureBox.TabStop = false;
      // 
      // DM0312_Loading_
      // 
      this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
      this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
      this.ClientSize = new System.Drawing.Size(200, 200);
      this.Controls.Add(this.imgPictureBox);
      this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
      this.MaximizeBox = false;
      this.MinimizeBox = false;
      this.Name = "DM0312_Loading_";
      this.ShowIcon = false;
      this.ShowInTaskbar = false;
      this.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Hide;
      this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
      this.Text = "Loading_";
      this.TransparencyKey = System.Drawing.Color.White;
      this.Activated += new System.EventHandler(this.DM0312_Loading__Activated);
      this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.DM0312_Loading__FormClosing);
      this.Load += new System.EventHandler(this.DM0312_Loading__Load);
      ((System.ComponentModel.ISupportInitialize)(this.imgPictureBox)).EndInit();
      this.ResumeLayout(false);

    }

    #endregion

    private System.Windows.Forms.PictureBox imgPictureBox;
  }
}