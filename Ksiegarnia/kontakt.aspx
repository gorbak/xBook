<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="kontakt.aspx.cs" Inherits="Ksiegarnia.kontakt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <div class=zawartosc>
        <div class=formularz>
        
          <table id=kontakt>
          <tr>
          <td colspan=2 style="color:black;font-size:16px;text-align:center;text-shadow:0 0 0 !important;">
          Masz pytanie lub problem? <Br />Wyślij wiadomość a odpiszemy!
          </td>
          </tr>

                <tr>
                    <td>
                        Twój E-mail:</td>
                    <td>
                        <asp:TextBox ID="T_imie" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Temat</td>
                    <td>
                        <asp:TextBox ID="T_temat" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Wiadomość:</td>
                    <td>
                        <asp:TextBox ID="T_tresc" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan=2>
                        <asp:Button ID="B_wyslij" runat="server" Text="Wyślij" OnClick='Wyslij' />
                    </td>
                </tr>
            </table>
            <asp:Label ID=displaymessage runat=server Visible=false Text=''></asp:Label>
 
     </div>
 </div></div>
</asp:Content>
