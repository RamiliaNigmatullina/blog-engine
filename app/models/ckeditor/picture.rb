class Ckeditor < Ckeditor::Asset
  class Picture
    mount_uploader :data, CkeditorPictureUploader, mount_on: :data_file_name

    def url_content
      url(:content)
    end
  end
end
