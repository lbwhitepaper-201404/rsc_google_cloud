name             'rsc_google_cloud'
maintainer       'RightScale Inc'
maintainer_email 'premium@rightscale.com'
license          'Apache 2.0'
description      'Installs/Configures rsc_google_cloud'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

depends "rightscale"
depends "google_cloud"

recipe "rsc_google_cloud::default", "set's up the rightscale google cloud environment"
recipe "rsc_google_cloud::lb_do_attach", "attaches from RightScale to gce-lb"
recipe "rsc_google_cloud::lb_do_detach", "detaches from RightScale to gce-lb"

attribute "rsc_google_cloud/instance_id",
  :display_namme => "RightScale Instance ID",
  :description => "RightScale Instance ID, should be set to Env:INSTANCE_ID",
  :required => "required",
  :recipes => [ "rsc_google_cloud::default" ]

attribute "google_cloud/lb/pool_name",
  :display_name => "Google LB Pool Name",
  :description => "Google LB Pool Name",
  :required => "required",
  :recipes => [ "rsc_google_cloud::lb_do_attach", "rsc_google_cloud::lb_do_detach" ]

attribute "google_cloud/region",
  :display_name => "Google Cloud Region",
  :description => "Google Cloud Region",
  :choice => [ "us-central1", "us-central2", "europe-west1" ],
  :required => "required"

attribute "google_cloud/lb/tag",
  :display_name => "Google LB Firewall Tag",
  :description => "Google LB Firewall Tag",
  :required => "optional",
  :default => "www"

attribute "google_cloud/lb/ip",
  :display_name => "Google LB IP",
  :description => "Google Cloud Static IP",
  :required => "required"

attribute "google_cloud/instance_id",
  :display_name => "Google Cloud Instance ID",
  :description => "Google Cloud Instance ID, don't use if using rsc_google_cloud::default",
  :required => "optional",
  :recipes => [ "rsc_google_cloud::default" ]

attribute "rsc_google_cloud/datacenter",
  :display_name => "Google/RightScale Datacenter",
  :description => "Google/RightScale Datacenter- Env/datacenter",
  :required => "required",
  :recipes => [ "rsc_google_cloud::default" ]

