import os
import io
from googleapiclient.discovery import build
from googleapiclient.http import MediaIoBaseDownload
from google.oauth2.service_account import Credentials

SCOPES = [
    'https://www.googleapis.com/auth/drive'
]

class GDrive:
    def __init__(self):
        self.filename = os.path.join(os.path.expanduser("~"), ".google_drive_creds")
        self.creds = Credentials.from_service_account_file(self.filename, scopes=SCOPES)
        self.client = build('drive', 'v3', credentials=self.creds)
        print("Connected to Google Drive!")


    def download_file(self, file_id): 
        """
        Download a specific file based on the file ID
        """ 
        fh = io.BytesIO()
        request = self.client.files().get_media(fileId=file_id)
        downloader = MediaIoBaseDownload(fh, request)
        
        done = False
        while done is False:
            status, done = downloader.next_chunk()



def main():
    gd = GDrive()
    gd.download_file("1Vd4TbNZXojDGppzoJNZN7XkHT7C0SrG2")

if __name__ == "__main__":
    main()
