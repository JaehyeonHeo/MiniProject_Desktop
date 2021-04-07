using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;

namespace WpfSMSApp.View.Store
{
    /// <summary>
    /// MyAccount.xaml에 대한 상호 작용 논리
    /// </summary>
    public partial class EditStore : Page
    {
        private int StoreId { get; set;  }
        private Model.Store CurrentStore { get; set; }

        public EditStore()
        {
            InitializeComponent();
        }

        /// <summary>
        /// 추가생성자 => StoreList에서 storeId를 받아옴 !!!
        /// </summary>
        /// <param name="storeId"></param>
        public EditStore(int storeId) : this() 
        {
            StoreId = storeId; 
        }

        private  void Page_Loaded(object sender, RoutedEventArgs e)
        {
            //라벨 에러메세지 숨겨놓기 !
            LblStoreName.Visibility = LblStoreLocation.Visibility = Visibility.Hidden;
            TxtStoreID.Text = TxtStoreName.Text = TxtStoreLocation.Text = "";

            try
            {
                //store 테이블에서 내용 읽음 
                CurrentStore = Logic.DataAccess.GetStores().Where(s => s.StoreID.Equals(StoreId)).FirstOrDefault();
                TxtStoreID.Text = CurrentStore.StoreID.ToString();
                TxtStoreName.Text = CurrentStore.StoreName;
                TxtStoreLocation.Text = CurrentStore.StoreLocation; 
            }
            catch (Exception ex)
            {
                Commons.LOGGER.Error($"EditStore.xaml.cs Page Loaded 예외발생 : {ex}");
                Commons.ShowMessageAsync("예외", $"예외발생 : {ex}"); 
            }
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack(); 
        }
        
        /// <summary>
        /// 정상 입력값 확인 메서드 
        /// </summary>
        /// <returns></returns>
        public bool IsValidInput()
        {
            bool isValid = true;

            if (string.IsNullOrEmpty(TxtStoreName.Text))
            {
                LblStoreName.Visibility = Visibility.Visible;
                LblStoreName.Text = "창고명을 입력하세요";
                isValid = false;
            }
            else
            {
                var cnt = Logic.DataAccess.GetStores().Where(u => u.StoreName.Equals(TxtStoreName.Text)).Count();
                if (cnt > 0)
                {
                    LblStoreName.Visibility = Visibility.Visible;
                    LblStoreName.Text = "이미 창고이름이 존재합니다";
                    isValid = false; 
                }
            }

            if (string.IsNullOrEmpty(TxtStoreLocation.Text))
            {
                LblStoreLocation.Visibility = Visibility.Visible;
                LblStoreLocation.Text = "창고위치를 입력하세요";
                isValid = false;
            }

            return isValid; 
        }
        
        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            bool isValid = true;
            LblStoreName.Visibility = LblStoreLocation.Visibility = Visibility.Hidden;

            isValid = IsValidInput(); // 유효성 체크 = 개발자에게 필수 !!!!

            if (isValid)
            {
                CurrentStore.StoreName = TxtStoreName.Text;
                CurrentStore.StoreLocation = TxtStoreLocation.Text;

                try
                {
                    var result = Logic.DataAccess.SetStore(CurrentStore);
                    if (result == 0)
                    {
                        Commons.LOGGER.Error($"AddStroe.xaml.cs 창고정보 수정 오류발생");
                        Commons.ShowMessageAsync("오류", "수정 오류가 발생"); 
                    }
                    else
                    {
                        NavigationService.Navigate(new StoreList());
                    }
                }
                catch (Exception ex)
                {
                    Commons.LOGGER.Error($"예외발생 {ex}"); 
                }
            }
        }

        private void TxtStoreName_LostFocus(object sender, RoutedEventArgs e)
        {
            IsValidInput(); 
        }

        private void TxtStoreLocation_LostFocus(object sender, RoutedEventArgs e)
        {
            IsValidInput(); 
        }
    }
}
