using iTextSharp.text;
using iTextSharp.text.pdf;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;

namespace WpfSMSApp.View.User
{
    /// <summary>
    /// MyAccount.xaml에 대한 상호 작용 논리
    /// </summary>
    public partial class UserList : Page
    {
        public UserList()
        {
            InitializeComponent();
        }

        private  void Page_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                RdoAll.IsChecked = true; 

            }
            catch (Exception ex)
            {
                Commons.LOGGER.Error($"예외발생 UserList Loaded : {ex}");
                throw ex; 
            }
        }

        private void BtnEditMyAccount_Click(object sender, RoutedEventArgs e)
        {
            // NavigationService.Navigate(new EditAccount()); //계정정보 수정 화면(EditAccount)으로 전환 
        }

        private void BtnAddUser_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                NavigationService.Navigate(new AddUser());

            }
            catch (Exception ex)
            {
                Commons.LOGGER.Error($"예외발생 BtnAddUser : {ex}");
                throw ex; 
            }
        }

        private void BtnEditUser_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                NavigationService.Navigate(new EditUser());

            }
            catch (Exception ex)
            {
                Commons.LOGGER.Error($"예외발생 BtnEditUser_Click : {ex}");
                throw ex;
            }
        }

        private void BtnDeactivateUser_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                NavigationService.Navigate(new DeactiveUser());

            }
            catch (Exception ex)
            {
                Commons.LOGGER.Error($"예외발생 BtnDeactiveUser_Click : {ex}");
                throw ex;
            }
        }
        private void BtnExportPdf_Click(object sender, RoutedEventArgs e)
        {
            SaveFileDialog saveDialog = new SaveFileDialog();
            saveDialog.Filter = "PDF File(*.pdf)|*.pdf";
            saveDialog.FileName = "";
            if (saveDialog.ShowDialog() == true )
            {
                // pdf 변환과정 --> 라이브러리 추가 
                try
                {
                    // 0. 폰트설정 
                    string nanumPath = Path.Combine(Environment.CurrentDirectory, @"NanumGothic.ttf"); // 폰트 경로
                    BaseFont nanumBase = BaseFont.CreateFont(nanumPath, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
                    var nanumTitle = new iTextSharp.text.Font(nanumBase, 20f); // 사이즈 20짜리 타이틀 폰트 생성 
                    var nanumContent = new iTextSharp.text.Font(nanumBase, 12f); // 내용에 쓸 폰트 생성 
                    string pdfFilePath = saveDialog.FileName;

                    // 1. PDF 객체생성 
                    iTextSharp.text.Document pdfDoc = new Document(PageSize.A4);

                    // 2. PDF 내용 만들기 
                    Paragraph title = new Paragraph("부경대 재고관리시스템(SMS)\n", nanumTitle);
                    Paragraph subTitle = new Paragraph($"사용자리스트 exported : {DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")}\n\n", nanumContent);

                    PdfPTable pdfTable = new PdfPTable(GrdData.Columns.Count);
                    pdfTable.WidthPercentage = 100; 

                    // 그리드 헤더 작업 
                    foreach (DataGridColumn column in GrdData.Columns)
                    {
                        PdfPCell cell = new PdfPCell(new Phrase(column.Header.ToString(), nanumContent));
                        cell.HorizontalAlignment = Element.ALIGN_CENTER;
                        cell.VerticalAlignment = Element.ALIGN_CENTER; 
                        pdfTable.AddCell(cell);
                    }
                    // 헤더의 각 셀 사이즈 조정 
                    float[] columnsWidth = new float[] { 6f, 15f, 10f, 15f, 28f, 12f, 12f };
                    pdfTable.SetWidths(columnsWidth); 
                    ; 

                    // 그리드 Row 작업 
                    foreach (var item in GrdData.Items)
                    {
                        if (item is Model.User)
                        {
                            var temp = item as Model.User;
                            // UserId
                            PdfPCell cell = new PdfPCell(new Phrase(temp.UserID.ToString(), nanumContent));
                            cell.HorizontalAlignment = Element.ALIGN_CENTER;
                            pdfTable.AddCell(cell);
                            // UserIdentityNumber
                            cell = new PdfPCell(new Phrase(temp.UserIdentityNumber.ToString(), nanumContent));
                            cell.HorizontalAlignment = Element.ALIGN_LEFT;
                            pdfTable.AddCell(cell);
                            // UserSurname
                            cell = new PdfPCell(new Phrase(temp.UserSurname.ToString(), nanumContent));
                            cell.HorizontalAlignment = Element.ALIGN_LEFT;
                            pdfTable.AddCell(cell);
                            // UserName
                            cell = new PdfPCell(new Phrase(temp.UserName.ToString(), nanumContent));
                            cell.HorizontalAlignment = Element.ALIGN_LEFT;
                            pdfTable.AddCell(cell);
                            // UserEmail
                            cell = new PdfPCell(new Phrase(temp.UserEmail.ToString(), nanumContent));
                            cell.HorizontalAlignment = Element.ALIGN_LEFT;
                            pdfTable.AddCell(cell);
                            // UserAdmin
                            cell = new PdfPCell(new Phrase(temp.UserAdmin.ToString(), nanumContent));
                            cell.HorizontalAlignment = Element.ALIGN_LEFT;
                            pdfTable.AddCell(cell);
                            // UserActivated
                            cell = new PdfPCell(new Phrase(temp.UserActivated.ToString(), nanumContent));
                            cell.HorizontalAlignment = Element.ALIGN_LEFT;
                            pdfTable.AddCell(cell);
                        }
                    }

                    // 3. PDF 파일생성 
                    using (FileStream stream = new FileStream(pdfFilePath, FileMode.OpenOrCreate))
                    {
                        PdfWriter.GetInstance(pdfDoc, stream);
                        pdfDoc.Open();
                        // 2에서 만든 내용을 추가 
                        pdfDoc.Add(title);
                        pdfDoc.Add(subTitle);
                        pdfDoc.Add(pdfTable); 
                        pdfDoc.Close();
                        stream.Close();  // close는 해도되고 안해도됨 !
                    }

                    Commons.ShowMessageAsync("PDF변환", "PDF 익스포트 성공했습니다!"); 

                }
                catch (Exception ex)
                {
                    Commons.LOGGER.Error($"예외발생 BtnExportPdf_Click : {ex}");
                }
            }
        }

        private void RdoAll_Checked(object sender, RoutedEventArgs e)
        {
            try
            {
                List<WpfSMSApp.Model.User> users = new List<Model.User>();

                if (RdoAll.IsChecked == true)
                {
                    users = Logic.DataAccess.GetUsers(); 
                }

                this.DataContext = users; 

            }
            catch (Exception ex)
            {
                Commons.LOGGER.Error($"예외발생 : {ex}"); 
            }
        }

        private void RdoActive_Checked(object sender, RoutedEventArgs e)
        {
            try
            {
                List<WpfSMSApp.Model.User> users = new List<Model.User>();

                if (RdoActive.IsChecked == true)
                {
                    users = Logic.DataAccess.GetUsers().Where(u => u.UserActivated == true).ToList(); 
                }

                this.DataContext = users;

            }
            catch (Exception ex)
            {
                Commons.LOGGER.Error($"예외발생 : {ex}");
            }
        }

        private void RdoDeactive_Checked(object sender, RoutedEventArgs e)
        {
            try
            {
                List<WpfSMSApp.Model.User> users = new List<Model.User>();

                if (RdoDeactive.IsChecked == true)
                {
                    users = Logic.DataAccess.GetUsers().Where(u => u.UserActivated == false).ToList(); 
                }

                this.DataContext = users;

            }
            catch (Exception ex)
            {
                Commons.LOGGER.Error($"예외발생 : {ex}");
            }
        }
    }
}
