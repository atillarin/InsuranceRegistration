<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Urun.aspx.cs" Inherits="BupaBootcamp.Webform.Urun" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="assent/css/bootstrap.min.css">
    <style type="text/css">
        .hideGridColumn {
            display: none;
        }
    </style>
    <title>Başvuru Formu</title>
</head>
<body>
    <div class="container">
        <br>
        <h3>Sağlık Sigortası Başvuru Formu</h3>
        <h4>Ürün Seçimi</h4>
        <div class="col-md-6 form-group">
            <form id="form1" runat="server">
                <br>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BupaPatikaConnectionString %>" SelectCommand="sp_GetProducts" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:GridView CssClass="table table-bordered table-hover" ID="teminat" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="teminat_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seç" />
                        <asp:BoundField DataField="Teminatlar" HeaderText="Teminatlar" SortExpression="Teminatlar" />
                        <asp:BoundField DataField="Prim" HeaderText="Prim" SortExpression="Prim" />
                        <asp:BoundField DataField="ProductID" HeaderText="ID" HeaderStyle-CssClass="hideGridColumn" ItemStyle-CssClass="hideGridColumn" />
                    </Columns>
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
                </asp:GridView>
                <label>* Tek sigortalı için ödenmesi gereken tedavi primleridir.</label>
                <br>
                <br>
                <div class="row">
                    <div class="d-flex justify-content-start col-md-6">
                        <asp:Button CssClass="btn btn-warning" ID="sigortaligirisi" runat="server" Text="<---Sigortalı Girişi" UseSubmitBehavior="False" OnClick="sigortaligirisi_Click" />
                    </div>
                    <div class="d-flex justify-content-end col-md-6">
                        <asp:Button CssClass="btn btn-success" ID="prim" runat="server" Text="Prim Bilgileri --->" OnClick="prim_Click" />
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
