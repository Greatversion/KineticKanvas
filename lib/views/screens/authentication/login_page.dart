import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BackgroundImageContainer(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          const Padding(
            padding:
                EdgeInsets.only(top: 235, right: 263, bottom: 15, left: 32),
            child: Text(
              'Log In',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: 358,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.red,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                    PrimaryTextFormField(
                      hintText: 'Email',
                      controller: emailController,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      width: 326,
                      height: 48,
                      fillColor: Colors.white,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    PrimaryButton(
                      onTap: () {},
                      borderRadius: 8,
                      fontSize: 14,
                      height: 48,
                      width: 326,
                      text: 'Continue',
                      textColor: Colors.black,
                      bgColor: Colors.white,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    PrimaryTextButton(
                      title: 'Forgot password?',
                      fontSize: 14,
                      onPressed: () {},
                      textColor: Colors.white,
                    ),
                    const SizedBox(height: 32),
                    const DividerRow(),
                    CustomRichText(
                      subtitle: ' Sign up ',
                      title: 'Don’t have an account?',
                      subtitleTextStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                      onTab: () {},
                    )
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    ));
  }
}

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTab,
    required this.subtitleTextStyle,
  });
  final String title, subtitle;
  final TextStyle subtitleTextStyle;
  final VoidCallback onTab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: RichText(
        text: TextSpan(
          text: title,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Inter'),
          children: <TextSpan>[
            TextSpan(
              text: subtitle,
              style: subtitleTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class DividerRow extends StatelessWidget {
  const DividerRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'or',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(child: Divider())
      ],
    );
  }
}

class PrimaryTextButton extends StatelessWidget {
  const PrimaryTextButton(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.fontSize,
      required this.textColor});
  final Function() onPressed;
  final String title;
  final double fontSize;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}

class PrimaryButton extends StatefulWidget {
  final VoidCallback onTap;
  final String text;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? fontSize;
  final IconData? iconData;
  final Color? textColor, bgColor;
  const PrimaryButton(
      {Key? key,
      required this.onTap,
      required this.text,
      this.width,
      this.height,
      this.borderRadius,
      this.fontSize,
      required this.textColor,
      required this.bgColor,
      this.iconData})
      : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.95);
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.forward().then((_) {
          _controller.reverse();
        });
        widget.onTap();
      },
      child: ScaleTransition(
        scale: _tween.animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOut,
            reverseCurve: Curves.easeIn,
          ),
        ),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius!),
          ),
          child: Container(
            height: widget.height ?? 55,
            alignment: Alignment.center,
            width: widget.width ?? double.maxFinite,
            decoration: BoxDecoration(
              color: widget.bgColor,
              borderRadius: BorderRadius.circular(widget.borderRadius!),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.iconData != null) ...[
                  Icon(
                    widget.iconData,
                    color: Colors.red,
                  ),
                  const SizedBox(width: 4),
                ],
                Text(
                  widget.text,
                  style: TextStyle(
                    color: widget.textColor,
                    fontSize: widget.fontSize ?? 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PrimaryTextFormField extends StatelessWidget {
  PrimaryTextFormField(
      {super.key,
      required this.hintText,
      this.border,
      this.enabledBorder,
      this.focusedBorder,
      this.errorBorder,
      this.keyboardType,
      this.focusedErrorBorder,
      required this.controller,
      required this.width,
      required this.height,
      this.hintTextColor,
      this.fillColor,
      this.onChanged,
      this.onTapOutside,
      this.prefixIcon,
      this.prefixIconColor,
      this.inputFormatters,
      this.borderRadius = 8});
  final double? borderRadius;
  final Color? fillColor;
  final String hintText;
  final OutlineInputBorder? border,
      enabledBorder,
      focusedBorder,
      errorBorder,
      focusedErrorBorder;
  final List<TextInputFormatter>? inputFormatters;
  Widget? prefixIcon;
  Function(PointerDownEvent)? onTapOutside;
  final Function(String)? onChanged;
  final double width, height;
  TextEditingController controller;
  final Color? hintTextColor, prefixIconColor;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.red,
        ),
        decoration: InputDecoration(
          fillColor: fillColor ?? Colors.red,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: hintTextColor ?? Colors.red,
          ),
          prefixIcon: prefixIcon,
          prefixIconColor: prefixIconColor,
          border: border,
          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
          errorBorder: errorBorder,
          focusedErrorBorder: focusedErrorBorder,
        ),
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        onTapOutside: onTapOutside,
      ),
    );
  }
}

class BackgroundImageContainer extends StatelessWidget {
  const BackgroundImageContainer({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                "https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2021/04/Dance-Cover.jpg?w=1250&h=1120&crop=1",
              ),
              fit: BoxFit.cover)),
      child: child,
    );
  }
}
