# Tasks
namespace :foreman_theme_satellite do
  namespace :example do
    desc 'Example Task'
    task :task => :environment do
      # Task goes here
    end
  end
end

# Tests
namespace :test do
  desc "Test ForemanThemeSatellite"
  Rake::TestTask.new(:foreman_theme_satellite) do |t|
    test_dir = File.join(File.dirname(__FILE__), '../..', 'test')
    t.libs << ["test",test_dir]
    t.pattern = "#{test_dir}/**/*_test.rb"
    t.verbose = true
  end
end

Rake::Task[:test].enhance do
  Rake::Task['test:foreman_theme_satellite'].invoke
end

load 'tasks/jenkins.rake'
if Rake::Task.task_defined?(:'jenkins:unit')
  Rake::Task["jenkins:unit"].enhance do
    Rake::Task['test:foreman_theme_satellite'].invoke
  end
end

DICTIONARY = {"Foreman" => "Satellite", "foreman" => "satellite", "smart-proxy" => "capsule", "Smart-proxy" => "Capsule",
              "smart-proxies" => "capsules", "Smart-proxies" => "Capsules", "Smart Proxy" => "Capsule", "smart proxy" => "capsule","Smart-Proxies" => "capsules",
              "Compute profile" => "VM Attributes", "compute profile" => "VM Attributes", "oVirt" => "RHEV", "ovirt" => "RHEV", "Ovirt" => "RHEV",
              "FreeIPA" => "Red Hat Identity Management", "OpenStack" => "RHEL OpenStack Platform", "openstack" => "RHEL OpenStack Platform",
              "Openstack" => "RHEL OpenStack Platform", "Proxy" => "Capsule", "proxy" => "Capsule", "Proxies" => "Capsules", "proxies" => "Capsules"}


def check_for_repeats(words_arr)
  words_arr.each do |word|
    words_arr.delete(word)
    words_arr.unshift(word) if !words_arr.any? {|cell| cell.include? word}
  end
  words_arr
end

def switch_words(sentence)
  words = check_sentence(sentence)
  to_copy = sentence
  if words
    words = check_for_repeats(words)
    words.each_with_index do |replace, replacement_index|
      to_copy = to_copy.gsub(replace, DICTIONARY[words[replacement_index]]) if (!to_copy.include?("http") && !to_copy.include?(DICTIONARY[replace]))
    end
  end
  to_copy
end

def check_sentence(sentence)
  temp_arr = []
  DICTIONARY.each do |key, val|
    if sentence.include? key
      temp_arr << key
    end
  end
  return nil if temp_arr.empty?
  temp_arr
end

def get_pos_files_paths
  files_paths = Dir[Rails.root + "locale/**/*"]
  files_paths.select! {|path| path.match(/.*\/foreman.po\z/)}
  files_paths.select! {|path| !path.include?("/en/foreman.po")}
end

task :before_translation => :environment do
  files_paths = get_pos_files_paths
  files_paths.each do |file_path|
    f = File.open(file_path)
    translations = GetPomo::PoFile.parse(File.read(file_path)) + GetPomo::PoFile.parse(File.read(file_path))
    translations.each do |translation|
      translation.msgid = switch_words(translation.msgid)
      translation.msgstr = switch_words(translation.msgstr)
    end
    File.open(file_path,'w'){|f|
      f.write(GetPomo::PoFile.to_text(translations))
    }
  end
end

task :after_translation => :environment do
  dictionary = {}
  dictionary_translations = GetPomo::PoFile.parse(File.read( Rails.root + 'locale/en/foreman.po')) + GetPomo::PoFile.parse(File.read( Rails.root + 'locale/en/foreman.po'))
  dictionary_translations.each do |cell|
    dictionary[cell.msgstr] = cell.msgid
  end
  dictionary_translations.clear
  files_paths = get_pos_files_paths
  files_paths.each do |file_path|
    f = File.open(file_path)
    translations = GetPomo::PoFile.parse(File.read(file_path)) + GetPomo::PoFile.parse(File.read(file_path))
    translations.each do |translation|
      translation.msgid = dictionary[translation.msgid] unless translation.msgid.empty?
    end
    File.open(file_path,'w'){|f|
      f.write(GetPomo::PoFile.to_text(translations))
    }
  end
end

task :create_english_dictionary => :environment do
  file_path = Rails.root + "locale/en/foreman.po"
  f = File.open(file_path)
  translations = GetPomo::PoFile.parse(File.read( Rails.root + 'locale/en/foreman.po')) + GetPomo::PoFile.parse(File.read( Rails.root + 'locale/en/foreman.po'))
  translations.each do |translation|
    translation.msgstr = switch_words(translation.msgid)
  end
  File.open(file_path,'w'){|f|
    f.write(GetPomo::PoFile.to_text(translations))
  }
end
