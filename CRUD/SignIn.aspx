<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="CRUD.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 165px;
        }
        .auto-style3 {
            margin-left: 80px;
        }
        .auto-style4 {
            background-color: #00FFFF;
        }
        .auto-style5 {
            width: 165px;
            background-color: #00FFFF;
        }
    </style>
    <script type="text/javascript">
        //debugger;
        function Valid_Login() {
            var UserName, Password;
            UserName = document.getElementById('<%= txt_UserName.ClientID %>').value;
            Password = document.getElementById('<%= txt_Pwd.ClientID %>').value;
            if (UserName == '' && Password == '') {
                alert('Invalid Credentials...');
                return false;
            }
            if (UserName == '') {
                alert('Enter UserName...');
                return false;
            }
            if (Password == '') {
                alert('Enter Password...');
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
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">USERNAME</td>
                    <td>
                        <asp:TextBox ID="txt_UserName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_UserName" runat="server" ControlToValidate="txt_UserName" ErrorMessage="Enter UserName" Font-Bold="True" ForeColor="Black" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">PASSWORD</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txt_Pwd" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_Pwd" runat="server" ControlToValidate="txt_Pwd" ErrorMessage="Enter Password" Font-Bold="True" ForeColor="Black" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style4">
                        <asp:Button ID="Btn_SignIn" runat="server" OnClick="Btn_SignIn_Click" Text="SIGNIN" OnClientClick="Valid_Login();" />
                        <asp:LinkButton ID="Link_ForgetPwd" runat="server" CausesValidation="False" OnClick="Link_ForgetPwd_Click" ForeColor="Black">FORGET PASSWORD</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style4">
                        <asp:LinkButton ID="Link_SignUp" runat="server" CausesValidation="False" OnClick="Link_SignUp_Click" ForeColor="Black">SIGNUP</asp:LinkButton>
                    &nbsp;
                        <asp:LinkButton ID="Lnk_Reset_Pwd" runat="server" CausesValidation="False" ForeColor="Black" OnClick="Lnk_Reset_Pwd_Click">RESET PASSWORD</asp:LinkButton>
                    </td>
                </tr>
                </table>
        </div>
    </form>
</body>
</html>
