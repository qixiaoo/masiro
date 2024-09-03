import 'package:flutter/material.dart';
import 'package:masiro/data/model/volume.dart';
import 'package:masiro/misc/context.dart';

class VolumeList extends StatefulWidget {
  final List<Volume> volumes;
  final int lastReadChapterId;
  final void Function(Chapter c, Volume v) onTap;

  const VolumeList({
    super.key,
    required this.volumes,
    required this.lastReadChapterId,
    required this.onTap,
  });

  @override
  State<VolumeList> createState() => _VolumeListState();
}

class _VolumeListState extends State<VolumeList> {
  late final List<_VolumePanel> panels;

  @override
  void initState() {
    super.initState();
    panels = widget.volumes.map((v) => _VolumePanel(volume: v)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme();

    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          panels[index].isExpanded = isExpanded;
        });
      },
      children: panels
          .asMap()
          .map((index, panel) {
            final chapters = ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(
                    panel.volume.title,
                    style: textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  onTap: () => setState(() {
                    panels[index].isExpanded = !panels[index].isExpanded;
                  }),
                );
              },
              body: Column(
                children: panel.volume.chapters.map((c) {
                  return ListTile(
                    title: Text(
                      c.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    selected: c.id == widget.lastReadChapterId,
                    onTap: () => widget.onTap(c, panel.volume),
                  );
                }).toList(),
              ),
              isExpanded: panel.isExpanded,
            );
            return MapEntry(index, chapters);
          })
          .values
          .toList(),
    );
  }
}

class _VolumePanel {
  Volume volume;
  bool isExpanded;

  _VolumePanel({
    required this.volume,
    // Avoid `dart fix --apply` from deleting unused parameters, see https://github.com/dart-lang/sdk/issues/54190
    // ignore: unused_element
    this.isExpanded = false,
  });
}
