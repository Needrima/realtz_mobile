import 'package:flutter/material.dart';

class ProductDetailsForm extends StatefulWidget {
  final void Function(String) changeStep;
  const ProductDetailsForm({super.key, required this.changeStep});

  @override
  State<ProductDetailsForm> createState() => _ProductDetailsFormState();
}

class _ProductDetailsFormState extends State<ProductDetailsForm> {
  bool forRent = false;
  bool forShortlet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: 'Listing ',
            style: Theme.of(context).textTheme.titleLarge,
            children: <TextSpan>[
              TextSpan(
                text: 'details',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: Theme.of(context).textTheme.labelMedium,
                prefixIcon: const Icon(
                  Icons.title_rounded,
                ),
                prefixIconColor: Theme.of(context).colorScheme.inversePrimary,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                filled: true,
                fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
              ),
              validator: (value) {
                if (!RegExp(r'^[a-zA-Z0-9]{5,}$').hasMatch(value.toString())) {
                  return 'Title must be atleast 5 alphabetnumeric characters';
                } else {
                  return null;
                }
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: (value) {
                print(value);
              },
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Description',
                hintStyle: Theme.of(context).textTheme.labelMedium,
                prefixIcon: const Icon(
                  Icons.abc_rounded,
                ),
                prefixIconColor: Theme.of(context).colorScheme.inversePrimary,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                filled: true,
                fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
              ),
              validator: (value) {
                if (!RegExp(r'^[a-zA-Z0-9]{20,800}$')
                    .hasMatch(value.toString())) {
                  return 'Description must be between 20 and 800 characters';
                } else {
                  return null;
                }
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: (value) {
                print(value);
              },
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              maxLines: null,
              decoration: InputDecoration(
                hintText:
                    'Properties(comma seperated e.g: 5 bedrooms, \nswimming pool, parking lot, pets allowed)',
                hintStyle: Theme.of(context).textTheme.labelMedium,
                prefixIcon: const Icon(
                  Icons.interests_rounded,
                ),
                prefixIconColor: Theme.of(context).colorScheme.inversePrimary,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                filled: true,
                fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
              ),
              validator: (value) {
                print(value);
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: (value) {
                print(value);
              },
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              maxLines: null,
              decoration: InputDecoration(
                hintText:
                    'Hash tags(comma seperated e.g: #pets_allowed, \n#attic, #swimming pool)',
                hintStyle: Theme.of(context).textTheme.labelMedium,
                prefixIcon: const Icon(
                  Icons.tag_rounded,
                ),
                prefixIconColor: Theme.of(context).colorScheme.inversePrimary,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                filled: true,
                fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
              ),
              validator: (value) {
                print(value);
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: (value) {
                print(value);
              },
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Location e.g: V.I, Lagos',
                hintStyle: Theme.of(context).textTheme.labelMedium,
                prefixIcon: const Icon(
                  Icons.location_on_rounded,
                ),
                prefixIconColor: Theme.of(context).colorScheme.inversePrimary,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                filled: true,
                fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
              ),
              validator: (value) {
                print(value);
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: (value) {
                print(value);
              },
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Address e.g 14, John Doe Avenue',
                hintStyle: Theme.of(context).textTheme.labelMedium,
                prefixIcon: const Icon(
                  Icons.location_city_rounded,
                ),
                prefixIconColor: Theme.of(context).colorScheme.inversePrimary,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                filled: true,
                fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
              ),
              validator: (value) {
                print(value);
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: (value) {
                print(value);
              },
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      Text(
                        'For shortlet',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Checkbox(
                        value: forShortlet,
                        onChanged: (value) {
                          setState(() {
                            forShortlet = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      Text(
                        'For rent',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Checkbox(
                        value: forRent,
                        onChanged: (value) {
                          setState(() {
                            forRent = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            if (forShortlet)
              SizedBox(
                child: Column(children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Shortlet Fee (nightly)',
                      hintStyle: Theme.of(context).textTheme.labelMedium,
                      prefixIcon: const Icon(
                        Icons.money_rounded,
                      ),
                      prefixIconColor:
                          Theme.of(context).colorScheme.inversePrimary,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.none),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.none),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
                    ),
                    validator: (value) {
                      print(value);
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onSaved: (value) {
                      print(value);
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Caution fee',
                      hintStyle: Theme.of(context).textTheme.labelMedium,
                      prefixIcon: const Icon(
                        Icons.money_rounded,
                      ),
                      prefixIconColor:
                          Theme.of(context).colorScheme.inversePrimary,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.none),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.none),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
                    ),
                    validator: (value) {
                      print(value);
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onSaved: (value) {
                      print(value);
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ]),
              ),
            if (forRent)
              SizedBox(
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Annual rent',
                        hintStyle: Theme.of(context).textTheme.labelMedium,
                        prefixIcon: const Icon(
                          Icons.money_rounded,
                        ),
                        prefixIconColor:
                            Theme.of(context).colorScheme.inversePrimary,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(style: BorderStyle.none),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(style: BorderStyle.none),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
                      ),
                      validator: (value) {
                        print(value);
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onSaved: (value) {
                        print(value);
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Agreement',
                        hintStyle: Theme.of(context).textTheme.labelMedium,
                        prefixIcon: const Icon(
                          Icons.money_rounded,
                        ),
                        prefixIconColor:
                            Theme.of(context).colorScheme.inversePrimary,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(style: BorderStyle.none),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(style: BorderStyle.none),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
                      ),
                      validator: (value) {
                        print(value);
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onSaved: (value) {
                        print(value);
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Commission',
                        hintStyle: Theme.of(context).textTheme.labelMedium,
                        prefixIcon: const Icon(
                          Icons.money_rounded,
                        ),
                        prefixIconColor:
                            Theme.of(context).colorScheme.inversePrimary,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(style: BorderStyle.none),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(style: BorderStyle.none),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
                      ),
                      validator: (value) {
                        print(value);
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onSaved: (value) {
                        print(value);
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Caution fee',
                        hintStyle: Theme.of(context).textTheme.labelMedium,
                        prefixIcon: const Icon(
                          Icons.money_rounded,
                        ),
                        prefixIconColor:
                            Theme.of(context).colorScheme.inversePrimary,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(style: BorderStyle.none),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(style: BorderStyle.none),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
                      ),
                      validator: (value) {
                        print(value);
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onSaved: (value) {
                        print(value);
                      },
                    ),
                  ],
                ),
              ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    widget.changeStep("1");
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Theme.of(context).colorScheme.inversePrimary,
                    ),
                    shape: const MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  child: const SizedBox(
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.changeStep("3");
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Theme.of(context).colorScheme.inversePrimary,
                    ),
                    shape: const MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  child: const SizedBox(
                    child: Text(
                      'Add Listing',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
