# frozen_string_literal: true

Fabricator(:group) do
  name { sequence(:name) { |n| "my_group_#{n}" } }
end

Fabricator(:public_group, from: :group) do
  public_admission true
  public_exit true
end

Fabricator(:imap_group, from: :group) do
  smtp_server "smtp.ponyexpress.com"
  smtp_port 587
  smtp_ssl true
  imap_server "imap.ponyexpress.com"
  imap_port 993
  imap_ssl true
  imap_mailbox_name "All Mail"
  imap_uid_validity 0
  imap_last_uid 0
  email_username "discourseteam@ponyexpress.com"
  email_password "test"
end
