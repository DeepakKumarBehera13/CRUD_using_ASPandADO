<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FORGET_PWD.aspx.cs" Inherits="CRUD.FORGET_PWD" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 143px;
        }
        .auto-style3 {
            background-color: #00FFFF;
        }
        .auto-style4 {
            width: 143px;
            background-color: #00FFFF;
        }
    </style>
    <script>
        function Valid_Forget_Pwd()
        {
            var EmailId;
            EmailId = document.getElementById('<%= txt_Email_id.ClientID %>').value;
            if (EmailId == '')
            {
                alert("ENTER EMAIL ADDRESS");
                return false;
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4">EMAILID</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txt_Email_id" runat="server" Width = "100"/>
                    &nbsp;<asp:RequiredFieldValidator ID="rfv_EmailId" runat="server" ControlToValidate="txt_Email_id" ErrorMessage="ENTER EMAIL ID" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    &nbsp;<asp:RegularExpressionValidator ID="rev_EmailId" runat="server" ControlToValidate="txt_Email_id" ErrorMessage="INVALID EMAIL ADDRESS" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" SetFocusOnError="True"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Label ID="lblMessage" runat="server" />
                    </td>
                 </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:LinkButton ID="lnk_BacktoLogin" runat="server" CausesValidation="False" ForeColor="Black" OnClick="lnk_BacktoLogin_Click">BACK TO SIGN IN</asp:LinkButton>
                    </td>
                    <td class="auto-style3">
                        <asp:Button ID="Btn_Send" Text="SEND" runat="server" OnClick="Btn_Send_Click" OnClientClick="Valid_Forget_Pwd();" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
