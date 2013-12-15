using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

enum PanelTypes
{
    UserPanel = 1,
    WorkerPanel,
    AdminPanel
}
namespace Ksiegarnia
{
    public partial class site : System.Web.UI.MasterPage
    {
        protected void schowajMenuUsera()
        {
            linkiPracownikLogged.Visible = false;
            linkiAdminLogged.Visible     = false;
            linkiUserLogged.Visible      = false;
            linkiLoggedOut.Visible       = true;
        }
        protected void pokazMenuUsera(int ktoreMenu)
        {
            linkiLoggedOut.Visible = false;
            switch(ktoreMenu)
            {
                default:
                case 1: // user
                    linkiUserLogged.Visible = true;
                    break;
                case 2: // worker
                    linkiUserLogged.Visible = true;
                    linkiPracownikLogged.Visible = true;
                    break;
                case 3: // admin
                    linkiUserLogged.Visible = true;
                    linkiAdminLogged.Visible = true;
                    break;
            }    
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            schowajMenuUsera();
            if (Session.Count > 0 && Session["login"].ToString() != null)
            {
                loginUsera.InnerHtml = "" + Session["login"].ToString() + "";
                int uprawnienia = int.Parse(Session["uprawnienia"].ToString());
                
                if(uprawnienia>0 && uprawnienia<3)
                {
                    pokazMenuUsera((int)PanelTypes.WorkerPanel);
                }
                else if (uprawnienia >= 3)
                {
                    pokazMenuUsera((int)PanelTypes.AdminPanel);
                }
                else
                {
                    pokazMenuUsera((int)PanelTypes.UserPanel);
                }

            }
        }
    }
}