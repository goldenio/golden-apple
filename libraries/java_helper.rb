class JavaHelper

  attr_accessor :java_home, :file_name

  def initialize url
    @url = url
    @file_name = url.split('/')[-1]
    @java_home = "#{installed_path}/Contents/Home"
  end

  def jdk_id
    @url.scan(/\/([6789]u[0-9][0-9]?-b[0-9][0-9])\//)[0][0]
  end

  def oracle_eula_cookie
    "oraclelicensejdk-#{jdk_id}-oth-JPR=accept-securebackup-cookie;gpw_e24=http://edelivery.oracle.com"
  end

  def download_path
    ::File.expand_path @file_name, Chef::Config[:file_cache_path]
  end

  def checksum_matched? checksum
    sha256sum(download_path) != checksum
  end

  def pkg_name
    return unless java_pkg_file?
    "#{package_name.upcase} #{major_number} Update #{update_number}"
  end

  def pkg_id
    return unless java_pkg_file?
    "com.oracle.#{package_name}#{major_number}u#{update_number}"
  end

  def pkg_location_name
    return unless java_pkg_file?
    "#{package_name}1.#{major_number}.0_#{update_number}.jdk"
  end

  def installed_path
    "/Library/Java/JavaVirtualMachines/#{pkg_location_name}"
  end

  protected

  def sha256sum file
    return false unless ::File.exists? file
    require 'digest'
    Digest::SHA256.file(file).hexdigest
  end

  def java_pkg_file?
    @file_name =~ /^(jre|jdk).*$/
  end

  def package_name
    @file_name.scan(/[a-z]+/)[0]
  end

  def major_number
    @file_name.scan(/\d+/)[0]
  end

  def update_number
    '%02d' % @file_name.scan(/\d+/)[1]
  end
end
