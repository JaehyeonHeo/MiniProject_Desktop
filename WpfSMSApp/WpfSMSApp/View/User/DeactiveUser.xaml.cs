using System;
using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;

namespace WpfSMSApp.View.User
{
    /// <summary>
    /// MyAccount.xaml에 대한 상호 작용 논리
    /// </summary>
    public partial class DeactiveUser : Page
    {
        public DeactiveUser()
        {
            InitializeComponent();
        }

        private  void Page_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                List<Model.User> users = Logic.DataAccess.GetUsers();
                this.DataContext = users;
            }
            catch (Exception ex)
            {
                Commons.LOGGER.Error($"예외발생 EditAccount Loaded : {ex}");
                throw ex; 
            }
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack(); 
        }

        private void GrdData_SelectedCellsChanged(object sender, SelectedCellsChangedEventArgs e)
        {
            // 선택된 값이 오른쪽 입력창에 나오도록 처리 !! 
            try
            {
                var user = GrdData.SelectedItem as Model.User;

            }
            catch (Exception ex)
            {
                Commons.LOGGER.Error($"예외발생 GrdData_SelectedCellsChanged : {ex}"); 
            }
        }

        private async void BtnDeactive_Click(object sender, RoutedEventArgs e)
        {
            bool isValid = true;

            if (GrdData.SelectedItem == null)
            {
                await Commons.ShowMessageAsync("오류", "비활성화할 사용자를 선택하세요"); 
                //MessageBox.Show("비활성화할 사용자를 선택하세요");
                return; 
            }

            if (isValid)
            {
                try
                {
                    var user = GrdData.SelectedItem as Model.User;
                    user.UserActivated = false; 

                    var result = Logic.DataAccess.SetUser(user);
                    if (result == 0)
                    {
                        await Commons.ShowMessageAsync("오류", "사용자 수정에 실패했습니다");
                        return; 
                    }
                    else
                    {
                        NavigationService.Navigate(new UserList());
                    }
                }
                catch (Exception ex)
                {
                    Commons.LOGGER.Error($"비활성화 예외발생 : {ex}");
                }
            }

        }
    }
}
