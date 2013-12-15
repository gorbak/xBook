<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="rejestracja.aspx.cs" Inherits="Ksiegarnia.rejestracja" %>
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
    <form><div class=center style='width:400px;text-align:center;'>Rejestracja<br />
    <span style="font-size:11px">nowy użytkownik? załóż darmowe konto</span>
    </div>
    <br />
        <div runat=server id=divBledy class="bledy">
        <asp:Label ID="Label1_b" runat="server" Text=""></asp:Label></div>

    <div class="center formularzDiv"><table class="style1" style='width:400px;' align="center">
      <tr>
        <td align="left">
             <label runat=server id=Login_text>Login</label></td>
        <td>
          <asp:TextBox runat=server ID="login" runat="server" Width="200px"></asp:TextBox>
        </td>
      </tr>
    <tr>
    <td align="left">
        <label runat=server id=Haslo_text>Hasło</label></td>
    <td>
        <asp:TextBox runat=server ID="haslo" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td align="left">
        <label runat=server id=Powtorz_text>Powtórz hasło</label></td>
    <td>
        <asp:TextBox runat=server ID="powtorz" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td align="left">
        E-mail</td>
    <td>
        <asp:TextBox runat=server ID="mail" runat="server" Width="200px"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td align="left">
       <label runat=server id=Imie_text> Imię</label></td>
    <td>
        <asp:TextBox runat=server ID="imie" runat="server" Width="200px"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td align="left">
        Nazwisko</td>
    <td>
        <asp:TextBox runat=server ID="nazwisko" runat="server" Width="200px"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td colspan=2>
        <span style="font-size:12px;color:#777777"> Klikając przycisk, "Rejestruj" akceptujesz regulamin dotyczący korzystania z serwisu.</span>

    </td>
    </tr>
    <tr>
    <td align="left">
            <asp:Button runat=server ID="rejestruj" runat="server" Text="Rejestruj" onclick="rejestrujClick" 
            />
    </td>
    </tr>

    </table>
</div>
</asp:Content>
