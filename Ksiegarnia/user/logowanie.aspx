<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="logowanie.aspx.cs" Inherits="Ksiegarnia.logowanie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        #top
        {
           
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style='border-radius:5px;padding:5px;background:#eeeeee;'>
    <form><div class=center style='width:400px;text-align:center;'>Zaloguj się<br />
    <span style="font-size:11px">masz już konto? wpisz swoje dane</span>
    </div>
    <br />
            <div runat=server id=divBledy class="bledy">
        <asp:Label ID="Label1_b" runat="server" Text=""></asp:Label></div>
        <div class="center formularzDiv"><table class="style1" style='width:400px;' align="center">
            <tr>
                <td>
                    <label runat=server id="loginText">Login</label></td>
                <td>
                    <asp:TextBox runat=server ID="login" Width="200"></asp:TextBox>
            </tr>
            <tr>
                <td>
                    <label runat=server id="hasloText">Hasło</label></td>
                <td>
                    <asp:TextBox runat=server ID="haslo" Width="200" TextMode=Password></asp:TextBox>
            </tr>
            <tr>

                <td>
                    <asp:Button runat=server ID="zaloguj" Text="Zaloguj" OnClick="zalogujClick"/></td>
            <td>
                    <asp:CheckBox ID="checkboxZapamietaj" runat=server />
                    <span style="font-size:12px;color:#444444">  Zapamiętaj mnie</span>
            </td>
            </tr>
            </table>
        </div>

    </form>
</div>
</asp:Content>
