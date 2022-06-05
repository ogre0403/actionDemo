#  HW-01 上傳指引


## 作業要求：
1. 建立Deployment，image使用web service類型的image,例如nginx
2. 建立Service，類型使用NodePort，可以從本地利用curl透過NodePort存取Deployment的web service

## 繳交作業
1. fork HW-01 專案
3. 撰寫作業
   * 作業要求：若不符合，Github action 會失敗，而無評分資料
   * 將YAML檔至於manifest目錄內
   * 嚴禁修改 `.validate/*`以及 `.github/workflows` 的內容。若有修改，會導致無法建立PR
4. commit/push作業結果至自己的github repo
5. 向HW-01 專案 發起pull request，名稱必為 `HW-01-[a-z]{3}[0-9]{6}`，格式錯會導致無法建立PR
6. 至HW-01 專案 action頁業，檢視是否測試成功，若不成功，可以無限重新push修正的版本，直到deadline
7. 