<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="koszyk.aspx.cs" Inherits="Ksiegarnia.koszyk" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


 <div class=zawartosc>
        <div class=formularz>
        <label style='' > Produkty z koszyka</label>

  <div class='koszykKsiazek' style='position:relative;'><div>Lp.</div><div>Tytuł</div><div>Autor</div><div>Cena</div><div>Ilość</div></div>
 <div runat=server id=zawartosc_koszyka>
 Koszyk pusty
</div>

 <div runat=server id=Div11111></div>
 <div runat=server id=div2222><input id="Button2" type=submit runat=server onserverclick="usun_z_koszyka" value='Opróżnij koszyk'><input id="Button1" type=button runat=server onclick='kup' style='position:absolute;right:20px;' value='Złóż zamówienie'><!---<asp:Button 
         ID="Button3" runat="server" onclick="usun_z_koszyka" Text="Button" />--->
     </div>
 </div></div>


</asp:Content>
