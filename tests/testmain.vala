
void main (string[] args) {
	Test.init (ref args);

	TestSuite.get_root ().add_suite (new TypeTests ().get_suite ());

	Test.run ();
}
