package com.zs.exception;

public class AppException extends Exception {
	//�����Զ����쳣�����쳣��Ϣ
		private String errMsg;//�쳣��Ϣ
		private int errCode;//�쳣����
		public String getErrMsg() {
			return errMsg;
		}
		public void setErrMsg(String errMsg) {
			this.errMsg = errMsg;
		}
		public int getErrCode() {
			return errCode;
		}
		public void setErrCode(int errCode) {
			this.errCode = errCode;
		}
		
		//�����вι��캯���������쳣��Ϣ���쳣���븳ֵ
		public AppException(String errMsg,int errCode){
			this.errMsg=errMsg;
			this.errCode=errCode;
		}
}
