using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PreliminarCobro.Views
{
  public partial class DM0312_Loading_ : Form
  {
    public bool LoaderCentrado = true;
    public DM0312_Loading_()
    {
      InitializeComponent();
    }

    private void DM0312_Loading__Load(object sender, EventArgs e)
    {
      this.BackColor = Color.White;
      this.TransparencyKey = Color.White;
      Imagen();
    }

    void Imagen()
    {
      imgPictureBox.Visible = true;

      imgPictureBox.BackColor = Color.White;

      imgPictureBox.BringToFront();
    }

    private void DM0312_Loading__FormClosing(object sender, FormClosingEventArgs e)
    {
      e.Cancel = true;
    }

    /// <summary>
    /// center the form to the owner form
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    /// Developer: Dan Palacios
    /// Date: 24/10/17
    private void DM0312_Loading__Activated(object sender, EventArgs e)
    {
      if (LoaderCentrado)
      {
        MoveLoader();
      }
    }

    /// <summary>
    /// Move loader
    /// </summary>
    /// Developer: Dan Palacios
    /// Date: 06/11/17
    public void MoveLoader()
    {
      if (Owner != null)
      {
        int boundWidth = this.Owner.Width;
        int boundHeight = this.Owner.Height;
        int x = boundWidth - this.Width;
        int y = boundHeight - this.Height;
        this.Location = new Point((this.Owner.Location.X) + x / 2, (this.Owner.Location.Y) + y / 2);
      }
    }


  }
}
