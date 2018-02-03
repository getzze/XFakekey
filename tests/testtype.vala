/* testtype.vala
 *
 */

using XFakekey;

public class TypeTests : XFakekey.TestCase {

	public TypeTests () {
		base ("Type");
		add_test ("[Fakekey] instanciate fakekey", test_instanciate_fakekey);
		add_test ("[Fakekey] type ascii",          test_type_ascii);
		add_test ("[Fakekey] type unicode",        test_type_unicode);
		add_test ("[Fakekey] type unicode 2",      test_type_unicode_2);
	}

	protected Fakekey test_xkbd;

	public void test_instanciate_fakekey () {
		// New instance
        test_xkbd = new Fakekey();
        
		// Check the instance exists
		assert (test_xkbd != null);
	}

	public void test_type_ascii () {
		// Check the instance exists
		assert (test_xkbd != null);

		// Check type
        test_xkbd.type("Hello world!");
	}

	public void test_type_unicode () {
		// Check the instance exists
		assert (test_xkbd != null);

		// Check type
        test_xkbd.type("Some_accents=éöêėē");
	}

	public void test_type_unicode_2 () {
		// Check the instance exists
		assert (test_xkbd != null);

		// Check type
        test_xkbd.type("Unicode=∆¶√쫊");
	}

}

