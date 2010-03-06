use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'	=> 'XML::Generator::PerlData',
    'VERSION_FROM' => 'PerlData.pm', # finds $VERSION,
    'PREREQ_PM' => {
                     'XML::SAX::Base' => 1.02
                   }
);
