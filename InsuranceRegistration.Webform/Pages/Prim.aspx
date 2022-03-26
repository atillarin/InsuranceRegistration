<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Prim.aspx.cs" Inherits="BupaBootcamp.Webform.Prim" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="assent/css/bootstrap.min.css">
    <title>Başvuru Formu</title>
</head>
<body>
    <div class="container">
        <br>
        <h3>Sağlık Sigortası Başvuru Formu</h3>
        <h4>Prim Bilgileri</h4>
        <div class="col-md-6 form-group">
            <form id="form1" runat="server">
                <div class="col-md-6">
                    <label>Ödeme Planı</label>
                    <asp:DropDownList CssClass="form-control" ID="odemeplani" runat="server" OnSelectedIndexChanged="odemeplani_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Value="1">Peşin</asp:ListItem>
                        <asp:ListItem Value="3">3 Taksit</asp:ListItem>
                        <asp:ListItem Value="6">6 Taksit</asp:ListItem>
                        <asp:ListItem Value="9">9 Taksit</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:GridView CssClass="table table-bordered table-hover" ID="odemetablosu" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    <Columns>
                        <asp:BoundField HeaderText="Taksit Sayısı" DataField="Installment" />
                        <asp:BoundField HeaderText="Taksit Tutarı" DataField="InstallmentAmount" />
                    </Columns>
                </asp:GridView>
                <label>* Ödeme ekranına geçtikten sonra önceki sayfalara geri dönemezsiniz! </label>
                <br>
                <div class="row">
                    <div class="d-flex justify-content-start col-md-6">
                        <asp:Button CssClass="btn btn-warning" ID="urunsecimi" runat="server" Text="<---Ürün Seçimi" UseSubmitBehavior="False" OnClick="urunsecimi_Click" />
                    </div>
                    <div class="d-flex justify-content-end col-md-6">
                        <asp:Button CssClass="btn btn-success" ID="odeme" runat="server" Text="Ödeme --->" OnClick="odeme_Click" />
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
